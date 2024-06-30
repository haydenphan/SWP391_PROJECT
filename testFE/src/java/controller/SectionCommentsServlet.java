package controller;

import DAO.SectionCommentDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.LocalDateTimeAdapter;
import model.SectionComment;
import model.User;

@WebServlet(name = "SectionCommentsServlet", urlPatterns = {"/SectionComments"})
public class SectionCommentsServlet extends HttpServlet {

    private SectionCommentDAO sectionCommentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize your DAO class here
        sectionCommentDAO = new SectionCommentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming parameters like position, offset, parentID, and sortBy are passed through query parameters
        Integer parentID = null;
        String sortBy = request.getParameter("sortBy");
        User user = (User) request.getSession().getAttribute("user");
        Integer UserID = user != null ? user.getUserID() : null;
        try {
            int offset = Integer.parseInt(request.getParameter("offset"));
            int position = Integer.parseInt(request.getParameter("position"));
            int sectionID = Integer.parseInt(request.getParameter("sectionID"));
            if (request.getParameter("parentID") != null) {
                parentID = Integer.parseInt(request.getParameter("parentID"));
            }
            // Retrieve comments from DAO
            List<SectionComment> comments = sectionCommentDAO.getCommentsBySection(sectionID, position, offset, parentID, sortBy, UserID);

            // Convert comments list to JSON using Gson library
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                    .create();
            String commentsJson = gson.toJson(comments);
            // Set content type and write JSON response
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(commentsJson);
            out.flush();
        } catch (Exception ex) {
            throw ex;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        try (BufferedReader reader = request.getReader()) {
            Gson gson = new Gson();
            JsonObject jsonRequest = gson.fromJson(reader, JsonObject.class);

            int sectionID = jsonRequest.get("sectionID").getAsInt();
            Integer parentID = jsonRequest.has("parentID") ? jsonRequest.get("parentID").getAsInt() : null;
            Integer repliedToUserID = jsonRequest.has("repliedToUserID") ? jsonRequest.get("repliedToUserID").getAsInt() : null;
            String content = jsonRequest.get("content").getAsString();

            SectionComment newComment = new SectionComment();
            newComment.setSectionID(sectionID);
            newComment.setParentCommentID(parentID);
            newComment.setCommentText(content);
            newComment.setUserID(user.getUserID());
            newComment.setRepliedToUserID(repliedToUserID);
            newComment.setCommentDate(LocalDateTime.now());

            sectionCommentDAO.insert(newComment);

            SectionComment insertedComment = sectionCommentDAO.getCommentByID(newComment.getCommentID(), user.getUserID());

            Gson gsonResponse = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                    .create();

            String commentJson = gsonResponse.toJson(insertedComment);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(commentJson);
            out.flush();
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid sectionID or parentID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }
        try {
            int commentID = Integer.parseInt(request.getParameter("commentID"));
            String content = request.getParameter("content");
            String mode = request.getParameter("mode");
            if (content != null && mode.equals("updating")) {
                if (!sectionCommentDAO.isUserOwnerOfComment(commentID, user.getUserID())) {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "not allowed");
                    return;
                }
                sectionCommentDAO.updateComment(commentID, content, user.getUserID());
                SectionComment updatedComment = sectionCommentDAO.getCommentByID(commentID, user.getUserID());
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                        .create();
                // Convert comments list to JSON using Gson library
                String commentJson = gson.toJson(updatedComment);
                // Set content type and write JSON response
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(commentJson);
                out.flush();
            }
            if (mode.equals("liking")) {
                boolean liked = sectionCommentDAO.changeLikeStatus(commentID, user.getUserID());
                Integer totalLikes = sectionCommentDAO.getTotalLikes(commentID);
                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("liked", liked);
                jsonResponse.addProperty("totalLikes", totalLikes);
                Gson gson = new Gson();
                String json = gson.toJson(jsonResponse);
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(jsonResponse);
                out.flush();
            }
        } catch (Exception e) {
            throw e;
        }
    }
}
