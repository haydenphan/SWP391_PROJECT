USE [master]
GO

CREATE DATABASE [QLNST]
GO
USE [QLNST]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO

CREATE TABLE [dbo]. [banner] (
  [id] [varchar](50) NOT NULL,
  [name] [varchar](255) NOT NULL,
  [note] [varchar](255) NOT NULL,
  [img] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `banner`
--

-- INSERT INTO `banner` (`id`, `name`, `note`, `img`) VALUES
-- (17, '', '', 'banner4-700820610533600.jpg'),
-- (19, '', '', 'banner3-700858753208200.jpg'),
-- (20, '', '', 'banner2-700871147408000.jpg'),
-- (21, '', '', 'banner1-700923691157800.jpg'),
-- (25, '', '', 'banner4-1161113133910100.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `boardnew`
--

CREATE TABLE  [dbo]. [boardnew] (
   [id] [varchar](255) NOT NULL,
  [title] [varchar](255) NOT NULL,
  [content] [text] NOT NULL,
  [image_link] [varchar](255) NOT NULL,
  [created] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `boardnew`
--

-- INSERT INTO `boardnew` (`id`, `title`, `content`, `image_link`, `created`) VALUES
-- (20, 'Thói quen vỗ, đập khi đồ điện tử trục trặc', 'Nhiều người cho rằng tác động lực đủ mạnh có thể khiến thiết bị điện tử hoạt động trở lại, nhưng vô tình làm sản phẩm nhanh hỏng.\r\n\r\nViệc tác động vật lý vào thiết bị điện tử để chúng hoạt động bình thường là hành động phổ biến của nhiều người. Phần lớn những người áp dụng thường học từ bạn bè, không hiểu rõ nguyên do.\r\n\r\nGiải thích về hiện tượng này, nhà nghiên cứu Mack Blakely thuộc Hội các nhà cung cấp dịch vụ điện tử quốc gia tại Mỹ, cho biết hàng chục năm trước khi khoa học công nghệ chưa phát triển, các linh kiện điện tử không được gắn kết với nhau một cách chặt chẽ. Do vậy, việc rung lắc nhẹ có thể khiến các đầu nối lỏng lẻo gắn kết lại với nhau.\r\n\r\nVà khi thấy hành động trên có hiệu quả, nhiều người cho rằng đó là cách sửa chữa tối ưu, không tốn tiền tìm thợ.\r\nNgày nay, một vài người vẫn giữ suy nghĩ này và áp dụng trên mọi thiết bị. Tuy nhiên các chuyên gia cảnh báo, việc vỗ, đập nhẹ chỉ có hiệu quả vào những thập niên 80, 90. Còn hiện tại, hành động trên có thể khiến sản phẩm hỏng nhanh hơn.\r\n\r\nNguyên nhân là bởi các thiết bị điện tử được chế tạo ngày càng tinh vi, nhiều vi mạch được thiết kế siêu nhỏ. Và chính những cú va đập mạnh có thể làm vi mạch điện tử đứt, gãy khiến thợ sửa chữa gặp khó khăn trong việc khắc phục.\r\n\r\n\"Với các chuyên gia có nhiều kinh nghiệm, việc gõ nhẹ là để xác định chỗ hở trong bảng mạch và tìm cách khắc phục. Nhưng tôi nhấn mạnh là gõ nhẹ thay vì tác động mạnh vào thiết bị như nhiều người vẫn làm\", ông Blakely nói.\r\n\r\nDo vậy, nếu thiết bị điện tử trong gia đình gặp sự cố, không liên quan đến nguồn điện, hệ thống phích cắm, người dùng nên tìm đến các đơn vị sửa chữa chuyên nghiệp để được hỗ trợ.', '666666666-202-3287-1680170290-1163585273145100.jpg', '2023-04-28'),
-- (21, '3 thương hiệu đồ gia dụng được yêu thích trên Shopee', 'Samsung, LocknLock và Tefal là ba thương hiệu thường xuyên được đánh giá 5 sao, lượng sản phẩm bán ra thuộc top đầu ngành hàng trên sàn TMĐT Shopee.\r\n\r\nGóp mặt tại sự kiện \"Siêu deal thương hiệu\" thuộc khuôn khổ chương trình \"3.3 siêu sale\" trên Shopee, Samsung, LocknLock và Tefal là ba trong số rất nhiều tên tuổi đình đám của ngành hàng thiết bị gia dụng được người dùng tích cực tìm kiếm, đặc biệt là nhóm khách hàng nội trợ. Đặc biệt, 3 thương hiệu càng được yêu thích hơn khi có mặt trong chuỗi ưu đãi hấp dẫn, bao gồm giảm giá sâu lên đến 50%, miễn phí vận chuyển cho đơn từ 0 đồng và cơ hội săn được voucher một triệu đồng được tung ra trong sự kiện.\r\n\r\nThương hiệu Samsung\r\n\r\nThành lập tại Hàn Quốc từ năm 1969, Samsung Electronics nhanh chóng trở thành công ty sản xuất đồ điện tử số một tại xứ sở kim chi nhờ vào dải sản phẩm phong phú và đi đầu trong việc ứng dụng công nghệ tiên tiến.\r\n\r\nTại Việt Nam, các sản phẩm điện gia dụng từ trung cấp đến cao cấp của hãng như: tủ lạnh, máy giặt, điều hòa nhiệt độ, lò vi sóng, máy hút bụi, các thiết bị bếp... được giới thiệu từ năm 2010 và nhanh chóng tạo nên một \"cơn sốt\" trong cộng đồng người tiêu dùng.\r\n\r\nGiữa cuộc cạnh tranh của nhiều thương hiệu từ khắp nơi trên thế giới, Samsung Electronics vẫn giữ được vị thế riêng nhờ sở hữu loạt ưu điểm về thiết kế và tính năng thông minh, độ bền bỉ cao và đặc biệt tiết kiệm điện năng.\r\nThương hiệu LocknLock\r\n\r\nVới lịch sử phát triển hơn 40 năm và độ phủ sóng trên 130 quốc gia, LocknLock ra mắt ở Hàn Quốc và nhanh chóng ghi tên vào hàng ngũ nhà sản xuất hàng tiêu dùng - kinh doanh hộp bảo quản kín hơi khóa 4 cạnh và những vật dụng nhà bếp tiên tiến hàng đầu thế giới.\r\n\r\nBên cạnh thiết kế thông minh, bền bỉ, sản phẩm của LocknLock còn được đánh giá cao về độ thân thiện với môi trường và an toàn cho sức khỏe. Đó cũng là lý do hàng LocknLock Việt Nam có giá nhỉnh hơn các thương hiệu nội địa khác nhưng vẫn là cái tên chiếm lĩnh thị trường.\r\nThương hiệu Tefal\r\n\r\nTefal là một trong những thương hiệu gia dụng lâu đời đến từ Pháp với lịch sử phát triển gần 70 năm, hiện có mặt tại hơn 120 quốc gia trên toàn thế giới. Thương hiệu dẫn đầu về các các sản phẩm gia dụng cao cấp như: bàn ủi, máy xay sinh tố, chảo chống dính, nồi chiên không dầu, nồi cơm điện, bình đun siêu tốc... và thường xuyên được người dùng đánh giá cao về chất lượng cũng như thiết kế.', '2-2540-1677237316-697871060160600.jpg', '2023-04-28'),
-- (22, 'Vì sao ngày càng ít người dùng lò vi sóng?', 'Ra đời năm 1945 và thống trị các nhà bếp khắp thế giới vào cuối thế kỷ 20, nhưng những năm gần đây lò vi sóng đang trở nên lỗi thời, bị nhiều gia đình xếp xó.\r\n\r\nLò vi sóng được phát minh bởi Percy Spencer, một kỹ sư của tập đoàn quốc phòng và hàng không vũ trụ đa quốc gia Raytheon. Khi mới ra đời, nó có kích thước như chiếc tủ lạnh, nặng hơn 300 kg và giá tới 3.000 USD, chủ yếu dùng trên tàu và xe lửa.\r\n\r\nNăm 1967, Raytheon mới phát triển một phiên bản gần giống với lò vi sóng ngày nay, từ đó món đồ này bắt đầu lan rộng. Tới năm 1993, hơn 80% hộ gia đình và hơn 3/4 công sở của Mỹ có lò vi sóng, theo Viện vi sóng Campbell.\r\n\r\nNhưng kể từ năm 2000, doanh số mặt hàng thiết bị gia dụng này bắt đầu giảm một nửa. Một bộ phận công chúng Mỹ lo ngại về bức xạ phát ra từ lò vi sóng và khả năng chúng làm giảm giá trị dinh dưỡng của thực phẩm. Khi mọi người trở nên ý thức hơn về sức khỏe và quan tâm nhiều hơn đến việc nấu ăn tươi, lò vi sóng càng bị thất sủng.\r\n\r\nGiới chuyên gia chỉ ra 4 lý do lò vi sóng hết thời.\r\n\r\nThiết bị nhà bếp thay đổi liên tục\r\n\r\nMối quan tâm ngày càng tăng đối với ẩm thực tươi sống đã thúc đẩy sự phổ biến của các thiết bị nhà bếp thay thế, như nồi nấu chậm, nồi sành, nồi chiên không dầu... Những đồ gia dụng mới tạo ra xu hướng nấu ăn mới và được nhiều người theo đuổi, đặc biệt người trẻ. Với sự phát triển không ngừng của thị trường thiết bị gia dụng, một số món đồ mới đang tranh giành thị trường, dẫn đến doanh số bán lò vi sóng liên tục giảm.\r\nÍt chức năng\r\n\r\nCó thể nấu nhiều món ăn từ lò vi sóng, nhưng nhiều gia đình chỉ sử dụng nó để hâm thức ăn và rã đông. Họ xem đây là món đồ để hâm thức ăn thừa.\r\n\r\nTrong khi các thiết bị gia dụng ngày càng đa chức năng, thì khả năng của lò vi sóng có vẻ hơi đơn điệu.\r\n\r\nĐộ an toàn thấp\r\n\r\nNhiều người hoảng sợ trước các tin tức về nổ lò vi sóng, từ nổ trứng, nổ cốc nước, nổ các loại hạt... Trên thực tế cũng có nhiều vấn đề khi sử dụng món đồ này. Không phải tất cả các chất liệu đều có thể cho vào lò vi sóng, đặc biệt là innox và nhựa. Nhựa có thể chảy, còn vật bằng kim loại có thể tạo ra nguy cơ phóng điện và gây nổ.\r\n\r\nHương vị thức ăn kém\r\n\r\nChức năng chính của lò vi sóng không phải để làm chín thức ăn mà là một thiết bị gia dụng giúp chúng ta hâm nóng thức ăn, rã đông. Nếu bạn muốn dùng lò vi sóng để làm thức ăn thì hương vị còn thua xa các thiết bị nhà bếp khác.', 'microwave-oven-6721-1671011490-698020073274500.jpg', '2023-04-28'),
-- (23, 'Thời hạn sử dụng của 8 đồ gia dụng hay bị quên', 'Giống như thực phẩm, đồ gia dụng cũng có thời hạn để đảm bảo an toàn cho người dùng.\r\n\r\nBộ lọc nước\r\n\r\nNhiều người cho rằng bộ lọc nước có thể tự làm sạch, nhưng thực tế chúng có thể trở thành nơi sản sinh của vi khuẩn nếu không được thay rửa thường xuyên. Vì vậy, bạn nên thay mới trung bình sáu tháng một lần.\r\n\r\nBàn là\r\n\r\nKhông phải tất cả bàn là đều được thiết kế để có thời gian dùng từ 10 đến 12 năm, nhất là khi nhà sản xuất chỉ bảo hành một năm.\r\n\r\nSau khoảng thời gian này, nếu thấy bàn là không hoạt động bình thường, mất nhiều thời gian để làm nóng, hoặc ủi bị hỏng đồ, bạn nên mua cái mới. Hãy nhớ, thay thế dễ hơn việc bạn cố gắng sửa hoặc mua quần áo mới.\r\n\r\nGiẻ lau\r\n\r\nNgười dùng nên thay khăn, giẻ lau nhà hai tháng một lần. Trong trường hợp không thay, sàn nhà dễ bị bẩn vì miếng vải cũ sẽ tích tụ nhiều vi khuẩn và vi trùng bên trong.\r\n\r\nĐiều này cũng áp dụng cho các loại giẻ lau khác và tuyệt đối không để chúng trong môi trường ẩm ướt. Tốt nhất là sau khi làm sạch, bạn nên cất khăn trong tủ hoặc nơi khô thoáng.\r\nThảm chùi chân\r\n\r\nBằng cách thay thảm chùi chân hai năm một lần hoặc sớm hơn nếu bị mòn, sẽ giúp ngôi nhà luôn sạch sẽ. Trong thời gian này gia chủ cũng nên giặt thảm và phơi khô thường xuyên.\r\n\r\nVỏ gối\r\n\r\nĐồ vật này có thể chứa mạt bụi, người dùng cần giặt một tuần một lần, và thay thế sau 1,2 năm sử dụng. Ngoài ra, bạn không nên đi ngủ với máy tóc ướt vì dễ khiến vỏ gối thành nơi sản sinh vi khuẩn.\r\n\r\nGhế xe hơi\r\n\r\nÍt ai biết ghế ô tô cũng có hạn sử dụng, bởi vật liệu này có xu hướng xuống cấp theo thời gian và không còn an toàn khi dùng. Theo quy định, một chiếc ghế có tuổi thọ từ 5 đến 6 năm, trước khi được thay mới.\r\n\r\nLò vi sóng\r\n\r\nSản phẩm này tồn tại khoảng 10 năm, nhưng thời gian không phải là lý do duy nhất khiến chúng cần được thay thế. Để đảm bảo thiết bị hoạt động bình thường hãy lắng nghe tiếng máy hoạt động. Một một lý do khác khiến bạn phải thay thế lò vi sóng khi làm nóng chậm hoặc hỏng gioăng cửa.\r\nRèm tắm\r\n\r\nBạn nên giặt rèm tắm mỗi tháng hoặc ít nhất 2, 3 tháng một lần và thay mới sau một năm sử dụng. Trong trường hợp không vệ sinh đúng cách, sản phẩm này sẽ xuất hiện dấu hiệu nấm mốc và buộc phải thay mới.', 'b38c9f581386805fd1996e5155-jpe-3678-6744-1654844541-698794768705000.jpg', '2023-04-28'),
-- (24, 'Khi nào nên thay lò vi sóng?', 'Theo các chuyên gia thiết bị gia dụng, bạn nên thay lò vi sóng 10 năm một lần. Nhiều sản phẩm bắt đầu trục trặc, kém chất lượng ở năm thứ 7, 8.\r\n\r\nLò vi sóng là một trong những phát minh hiệu quả của thế kỷ 20 và được sử dụng thường xuyên trong nhà bếp. Sản phẩm giúp chúng ta tiết kiệm thời gian và năng lượng một cách hiệu quả.\r\n\r\nTuy nhiên, như mọi thiết bị điện khác, lò vi sóng không bền mãi. Theo thời gian, sản phẩm sẽ giảm chất lượng, hao mòn và cần được thay thế. Vậy khi nào thì nên thay thế lò vi sóng mới?\r\n\r\nTheo các chuyên gia của trang Kitchn, nếu lò vi sóng của bạn có nhiều mùi khó ngửi, thức ăn không được làm nóng, chín đúng cách và tiêu tốn quá nhiều thời gian, đây là những dấu hiệu cho thấy đã đến lúc bạn nên thay thế lò vi sóng.\r\n\r\nTrong quá trình quay thực phẩm, nếu bạn thấy lò kêu to như tiếng mài, tiếng vo ve hay tiếng lạch cạch thì đây là dấu hiệu lò trục trặc. Nguyên nhân có thể do mâm xoay, cánh quạt...\r\n\r\nNếu lò phát ra khói, tia lửa, mùi khét, đây là dấu hiệu của vấn đề nghiêm trọng. Nên lập tức rút phích cắm của lò, đưa đến thợ sửa để tìm ra nguyên nhân. Nếu vấn đề nghiêm trọng, nên thay lò khác. Dưới đây là một số gợi ý.\r\n\r\nCửa lò không thể đóng kín\r\n\r\nKhi bạn đóng lò, cửa lò phải hoàn toàn kín. Đây là tính năng an toàn quan trọng, được thiết kế để ngăn chặn bức xạ. Nếu cánh cửa lò xuất hiện nứt, mòn hoặc vỡ, điều này là dấu hiệu rõ ràng cho việc thay một lò vi sóng mới.\r\n\r\nCác nút, phím bấm, xoay không hoạt động\r\n\r\nĐây là bộ phận không thể thiếu của lò vi sóng, do đó nếu bạn bấm vào mà các nút, phím... không hoạt động thì bạn sẽ gặp khó khăn trong việc thao tác với lò. Nếu việc vệ sinh không giúp cho tình trạng được cải thiện thì điều này có nghĩa các phím, nút đó đã bị liệt theo thời gian, lò cần được thay mới.\r\n\r\nĐể tăng tuổi thọ cho lò vi sóng, chăm sóc chúng đúng cách rất cần thiết. Có những mẹo mà bạn có thể áp dụng để giữ gìn lò bền hơn, ví dụ đừng để nước tràn ra ngoài, đừng làm lò vi sóng của bạn quá nóng, không bật nguồn lò vi sóng khi không có gì bên trong, vệ sinh lò thường xuyên, không đặt bất cứ thứ gì bằng kim loại vào trong, tránh đóng sầm cửa...\r\n\r\nMột mẹo phổ biến được nhiều người chia sẻ để làm sạch lò vi sóng là dọn sạch các thức ăn dư thừa còn sót lại trong lò, sau đó cho một bát nước có vài lát chanh hoặc cam vào đó, sau đó quay nóng trong vài phút. Cuối cùng, bạn bỏ bát nước ra, lấy khăn khô lau sạch các bộ phận của lò.', 'microwave-oven-6721-1671011490-698838669184600.jpg', '2023-04-28'),
-- (25, 'Nhu cầu mua tủ lạnh dung tích lớn tăng mạnh dịp cuối năm', 'Nhu cầu trữ thực phẩm tăng cao, nhất là dịp cận Tết, nhiều gia đình ở các thành phố bắt đầu tìm mua các dòng tủ lạnh dung tích lớn.\r\n\r\nChị Nguyễn Thị Kiều Diễm, nhân viên văn phòng 30 tuổi, ở TP Thủ Đức hơn một tháng qua vẫn đắn đo để chọn lựa cho mình một chiếc tủ lạnh như ý. Nhà có bốn thành viên, nhưng trước đây gia đình chị không có thói quen trữ thực phẩm. Chị cho biết: \"Gia đình thường chỉ mua lượng thực phẩm đủ dùng trong ngày chứ không dự trữ. Nếu thức ăn thừa, chúng tôi bỏ đi gây lãng phí\".\r\n\r\nĐợt giãn cách vừa qua, sau nhiều lần khu nhà bị phong tỏa, gia đình chị Diễm đã hình thành thói quen trữ thực phẩm để dùng trong nhiều ngày. Nhờ vậy, mỗi tháng, gia đình bốn người tiết kiệm được hơn 3 triệu đồng so với trước. Chiếc tủ lạnh nhỏ dung tích 165 lít phải hoạt động hết công suất trong suốt mùa dịch. Sau giãn cách, chị cùng chồng quyết làm mới nhịp sống của mình, bắt đầu bằng việc đổi tủ lạnh có dung tích lớn hơn.\r\n\r\n\"Gia đình tôi giờ quen mua rau củ, thịt cá dùng cho cả tuần, nhờ vậy tiết kiệm được nhiều thời gian và đỡ lãng phí. Vì thế, cả gia đình rất muốn tìm một mẫu tủ lạnh side by side có kiểu dáng hiện đại, nhiều tính năng thông minh và tiết kiệm điện\", chị Diễm chia sẻ.\r\n\r\nCùng nhu cầu như gia đình chị Diễm, anh Lê Trần Trung Lương, 43 tuổi, ở quận Gò Vấp đang tìm kiếm mẫu tủ lạnh hơn 400 lít cho gia đình \"tam đại đồng đường\". Cả nhà anh vừa đón niềm vui cuối năm khi dọn đến căn chung cư mới. Kỹ sư 43 tuổi bỏ ra hơn 300 triệu đồng để thiết kế lại không gian sống. Anh muốn tìm một mẫu tủ lạnh vừa có thiết kế hiện đại, sang trọng để làm điểm nhấn cho không gian bếp vừa đáp ứng được nhu cầu sử dụng của 6 người trong gia đình.', 'c2-5367-1639039740-698961883642100.png', '2023-04-28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE [dbo]. [catalog] (
 [id] [varchar](11) NOT NULL,
  [name] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

-- INSERT INTO `catalog` (`id`, `name`) VALUES
-- (3, 'Quạt'),
-- (4, 'Nồi cơm điện'),
-- (19, 'Tủ lạnh'),
-- (20, 'Bếp'),
-- (24, 'Lò nướng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordered`
--

CREATE TABLE [dbo]. [ordered] (
  [id] [varchar](255) NOT NULL,
  [product_id] [varchar](255) NOT NULL,
  [transaction_id] [varchar](11) NOT NULL,
  [qty] [varchar](11) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `ordered`
--

-- INSERT INTO `ordered` (`id`, `product_id`, `transaction_id`, `qty`) VALUES
-- (17, 'Quạt sạc Comet ARF01D113', 19, 1),
-- (18, 'Lò nướng Electrolux EOT30MXC 30 lít', 19, 1),
-- (19, 'Nồi Cơm Điện Sunhouse SHD8607W 1.8 lít', 20, 20),
-- (20, 'tủ lạnh', 21, 10),
-- (21, 'Quạt sạc Comet ARF01D113', 21, 1),
-- (22, 'quạt', 22, 9),
-- (23, 'tủ lạnh', 23, 10),
-- (24, 'Nồi Cơm Điện Sunhouse SHD8607W 1.8 lít', 23, 42),
-- (25, 'Quạt sạc Comet ARF01D113', 23, 40),
-- (26, 'Quạt Treo Asiavina VY377790 - Xám', 23, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE [dbo]. [product] (
  [id] [varchar](255) NOT NULL,
  [catalog_id] [varchar](11) NOT NULL,
  [name] [varchar](255) NOT NULL,
  [price] [varchar](255) NOT NULL,
  [status] [varchar](255) NOT NULL,
  [description] [text] NOT NULL,
  [content] [text] NOT NULL,
  [image_link] [varchar](255) NOT NULL,
  [created] [varchar](255) NOT NULL,
  [discount] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `product`
--

-- INSERT INTO `product` (`id`, `catalog_id`, `name`, `price`, `status`, `description`, `content`, `image_link`, `created`, `discount`) VALUES
-- (27, 3, 'Quạt Treo Asiavina VY377790 - Xám', '1090000', '1', 'Công suất 55W mạnh mẽ.\r\nCó remote điều khiển từ xa.\r\nSử dụng motor bạc thau có độ bền tốt.\r\n3 mức độ gió kết hợp 3 chế độ gió tùy chỉnh theo nhu cầu sử dụng.', 'Chất liệu bền bỉ\r\nThân quạt được làm bằng nhựa tạo sự cứng cáp và chắc chắn. Motor bên trong bằng bạc thau hoạt động êm ái, độ bền cao và tuổi thọ sử dụng được lâu. \r\nQuạt treo Asiavina VY377790 được làm từ các chất liệu bền bỉ\r\nThiết kế dạng quạt treo tường\r\nAsiavina VY377790 có vẻ ngoài màu xám trang nhã. Thiết kế dạng quạt treo tường gọn gàng và ít tốn diện tích không gian sử dụng. Sản phẩm có kích thước 47 x 69 x 36.5 cm (Ngang x Cao x Sâu), trọng lượng 3.5 kg. Quạt có 3 cánh, kích thước 40cm giúp làm mát không gian hiệu quả. \r\nCấu tạo của quạt treo tường Asiavina VY377790 \r\n3 chế độ gió\r\nAsiavina đã tích hợp cho dòng quạt VY377790 3 mức độ kết hợp 3 chế độ gió gồm: gió ngủ, gió tự nhiên, gió thường. Vì thế người dùng có thể tự do điều chỉnh gió tùy ý muốn. Bên cạnh đó quạt còn có chức năng hẹn giờ tắt rất thuận tiện cho việc sử dụng. ', 'quattreoasia-697021258840500.png', '2023-04-21', '45'),
-- (28, 24, 'Lò nướng thủy tinh Sanaky VH-158T 15 lít', '1050000', '1', 'Dung tích 15 L / Công suất 1300W.\r\nMức tạo nhiệt tối đa 250°C.\r\nHẹn giờ tối đa 60 phút.\r\nQuạt đảo nhiệt tạo dòng khí đối lưu.\r\nBảo hành 01 năm.', 'Dung tích nhỏ gọn\r\nLò Nướng SANAKY VH-158T có dung tích lò nhỏ gọn 15 lít với thân lò bằng thủy tinh chịu nhiệt dễ vệ sinh\r\n\r\nLò Nướng SANAKY VH-158T\r\n\r\nQuạt đối lưu đảo đều của Lò Nướng SANAKY VH-158T\r\nQuạt đối lưu đảo đều nhiệt độ trong lò giúp món nướng được chín nhanh, không bị cháy khét\r\n\r\nLò Nướng SANAKY VH-158T\r\n\r\nTích hợp nhiều chức năng\r\nLò nướng thuỷ tinh Sanaky VH 158T có núm chỉnh nhiệt độ, ngoài chức năng nướng thịt, nướng gà nguyên con dưới 1.5 kg, nướng rau củ, nướng bánh, lò còn có chức năng hâm nóng, quay, rô ti, chiên khô, rang…', 'Lò nướng thủy tinh Sanaky VH-158T 15 lít-696978254025900.png', '2023-04-21', '14'),
-- (29, 19, 'Tủ Lạnh Panasonic Inverter 188 Lít NR-BA229PAVN', '8490000', '1', 'Tính năng nổi bật:\r\nCông nghệ Ag Clean kháng khuẩn.\r\nTiết kiệm điện với công nghệ Inverter.\r\nCông nghệ làm lạnh Panorama.\r\nChứa đồ nhiều trên khay kệ kính chịu lực tốt.', 'Thiết kế sang trọng, lớp phủ sơn tĩnh điện bền bỉ, đẹp mắt\r\nTủ Lạnh Panasonic Inverter 188 lít NR-BA229PAVN thuộc kiểu tủ ngăn đá trên truyền thống nhưng vẫn sang trọng với lớp phủ sơn tĩnh điện màu xanh đẹp mắt, bền bỉ ắt hẳn sẽ làm bừng sáng không gian căn bếp nhà bạn.\r\nSở hữu dung tích 188 lít, tủ lạnh Panasonic sẽ đáp ứng cho nhu cầu lưu trữ thực phẩm của những hộ gia đình nhỏ khoảng 2 - 3 thành viên.\r\nKháng khuẩn, khử mùi hôi mạnh mẽ với công nghệ Ag Clean\r\nTủ lạnh Panasonic Inverter sử dụng công nghệ Ag Clean có khả năng giải phóng các ion Ag+ giúp kháng khuẩn và khử mùi hôi từ thực phẩm một cách hiệu quả, trả lại bầu không khí tươi mát, cho thực phẩm được thơm ngon, trọn vị.', 'Tủ Lạnh Panasonic Inverter 188 Lít NR-BA229PAVN-696927521979700.png', '2023-04-21', '31'),
-- (30, 4, 'Nồi Cơm Điện Sharp KS-181TJV 1.8 lít', '720000', '1', 'Tính năng nổi bật:\r\nMàu: Trắng hoa văn đen.\r\nNút gạt tiện lợi vô cùng.\r\nLòng nồi phủ chống dính poly-flon.\r\nCó muỗng xới cơm / Có xửng hấp.\r\nBảo hành 01 năm /Xuất xứ : Việt Nam', 'Lòng nồi hợp kim nhôm tráng men chống dính dày, bền\r\nNấu cơm tiết kiệm điện năng và thời gian, cho hạt cơm tơi ngon, không dính vào thành và đáy nồi, làm sạch thuận tiện.\r\n2 mâm nhiệt nấu cơm chín đều, ngon, trong thời gian ngắn\r\n \r\n\r\nNồi Cơm Điện SHARP KS-181TJV\r\nNgăn chứa nước thừa có thể tháo rời, tiện vệ sinh\r\nVan thoát hơi thông minh chống trào hiệu quả\r\nKiểm soát tốt quá trình thoát hơi nước trong nồi giúp giữ lại hàm lượng dinh dưỡng cao có sẵn trong gạo.', 'Nồi Cơm Điện Sharp KS-181TJV 1-8 lít-696912863888200.jpg', '2023-04-21', '18'),
-- (31, 20, 'Bếp gas du lịch Duxton DG-310', '399000', '1', 'Tính năng nổi bật:\r\nSử dụng cụm van thế hệ mới, ngắt gas an toàn .\r\nHệ thống đầu đốt theo tiêu chuẩn JIA (Nhật Bản).\r\nHiệu suất đốt tối ưu, nồng độ khí thải CO thấp.\r\nThân bếp được chế tạo theo công nghệ tổ hợp , vững chắc chịu va chạm.\r\nKiểu dáng mới, đẹp & màu đen bóng sang trọng.', 'Thiết kế đẹp mắt, hiện đại \r\nBếp gas du lịch Duxton DG-310 có kích thước 340 x 280 x 115mm khá nhỏ gọn, không chiếm quá nhiều diện tích. Kết hợp cùng với đó, trọng lượng của bếp là 1,5kg giúp bạn dễ dàng di chuyển đến bất kỳ đâu. Thích hợp với những buổi dã ngoại ngoài trời, du lịch, cắm trại,...\r\nChất liệu cao cấp\r\nThân bếp được chế tạo theo công nghệ tổ hợp, vững chắc, chịu va chạm tốt bền bỉ và dễ lau chùi sạch sẽ và cất giữ sau khi sử dụng xong.\r\nKiềng bếp được làm bằng thép, phủ thêm lớp sơn tĩnh điện bên ngoài không bị hoen gỉ, hoặc gãy khi sử dụng trong thời gian dài. Vậy nên,  người dùng có thể an tâm hơn khi nấu nướng những món ăn ngon phục vụ gia đình.  \r\n\r\nHệ thống đánh lửa Magneto\r\nBếp gas được trang bị hệ thống đánh lửa Magneto, có tác dụng phát ra tia lửa năng lượng điện kết hợp với khí gas. Từ đó, tạo ra được tia lửa nhanh chóng, có thể dùng được bền bỉ lâu dài, ít hư hỏng và dễ dàng sử dụng. Giúp quá trình nấu nướng tốn ít thời gian, và công sức hơn rất nhiều. \r\nNgoài ra, thiết bị có núm vặn bật tắt đơn giản, bạn có thể thao tác dễ dàng và nhanh chóng mà không gặp trở ngại nào kể cả những người lớn tuổi. ', 'Bếp gas du lịch Duxton DG-310-696894187826800.jpg', '2023-04-21', '28'),
-- (32, 3, 'Quạt lửng Yanfan L828', '550000', '1', 'Tính năng nổi bật:\r\nCông suất 47w.\r\nkích thước cánh 40cm.\r\n3 tốc độ gió.\r\nThiết kế trang nhã,\r\nHàng việt Nam chất lượng cao.', 'Công suất 47w\r\nL828 với công suất 47W cho bạn lựa chọn tùy thích để tạo gió mát và lan tỏa rộng, nhanh chóng mang lại không gian mát mẻ cho gia đình bạn. Bên cạnh đó quạt hoạt động mạnh mẽ, bền bỉ nhưng tiêu thụ điện ít, bạn sẽ tiết kiệm chi phí nhưng vẫn hưởng được những làn gió mát dịu, trong lành.\r\n', 'Quạt lửng Yanfan L828-696775227046100.jpg', '2023-04-21', '27'),
-- (33, 19, 'Tủ Lạnh Panasonic Inverter 170 Lít NR-BA190PPVN', '7590000', '1', 'Tính năng nổi bật:\r\nCông nghệ Inverter và cảm biến Econavi.\r\nCông nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+.\r\nHơi lạnh đồng đều khắp tủ với công nghệ làm lạnh Panorama.\r\nDung tích 170 lít cho gia đình 2-3 người.', 'Thiết kế hiện đại, lớp phủ sơn tĩnh điện bền bỉ\r\nTủ lạnh Panasonic Inverter 170 lít NR-BA190PPVN sở hữu màu xám đẹp mắt và sang trọng, cùng phủ lớp sơn tĩnh điện bền bỉ, làm bừng sáng không gian bếp nhà bạn. Với thiết kế ngăn đá trên quen thuộc, kích thước gọn gàng, tủ lạnh sẽ không chiếm nhiều diện tích trong phòng bếp nhỏ xinh nhà bạn.\r\n\r\n\r\n\r\nDung tích 170 lít đáp ứng tốt cho nhu cầu lưu trữ thực phẩm của những gia đình ít thành viên (2 - 3 người).\r\n\r\nCông nghệ Inverter kết hợp cảm biến Econavi tiết kiệm điện tối ưu, vận hành êm ái\r\nChiếc tủ lạnh Panasonic này sử dụng công nghệ biến tần Inverter có khả năng duy trì làm lạnh ổn định, máy nén hoạt động êm ái, ít tiếng ồn mà vẫn tiết kiệm đáng kể điện năng tiêu thụ.\r\n\r\n\r\n\r\nĐồng thời, cảm biến Econavi trên tủ lạnh có thể nhận biết sự thay đổi trong thói quen sinh hoạt, sau đó tự động điều chỉnh để nhiệt độ bên trong tủ luôn được duy trì lý tưởng và tiết kiệm năng lượng tiêu thụ.\r\n\r\nKháng khuẩn và khử mùi hiệu quả nhờ công nghệ Ag Clean với tinh thể bạc Ag+\r\nTủ lạnh Panasonic Inverter được trang bị công nghệ kháng khuẩn Ag Clean sử dụng các tinh thể bạc Ag+ có tác dụng loại bỏ lên đến 99.9% vi khuẩn gây hại, khử những mùi hôi khó chịu bên trong tủ. Nhờ vậy, thực phẩm luôn tươi ngon, không bị lẫn mùi, bảo vệ an toàn cho sức khỏe của cả gia đình.', 'Tủ Lạnh Panasonic Inverter 170 Lít NR-BA190PPVN-696745566431700.jpg', '2023-04-21', '36'),
-- (34, 4, 'Nồi Cơm Điện Tử Tefal 1.8 Lít RK736B68', '1999000', '1', 'Tính năng nổi bật:\r\nCông suất: 750W, dung tích : 1.8 Lít.\r\nCông nghệ điện từ Fuzzy Logic.\r\nLồng nồi niêu bằng nhôm phủ chống dính, độ dày 1.985 mm, 4 lớp.\r\nVỏ ngoài bằng nhựa cách nhiệt.\r\nVật dụng đi kèm: muỗng cơm, muỗng canh, ca đong, xửng hấp.', 'Nồi cơm điện sử dụng công nghệ điện từ Fuzzy Logic giúp nấu cơm chín kĩ và ngon nhất khi thưởng thức\r\nTự động điều chỉnh nhiệt độ nấu phù hợp với lượng gạo/loại gạo và nước trong nồi, cùng công suất hoạt động 750W giúp cơm chín nhanh, tiết kiệm điện. \r\n\r\n10 chương trình nấu cài đặt sẵn, dễ dàng chế biến đa dạng món ăn ngon\r\n10 chương trình nấu gồm: nấu gạo thơm, gạo trắng, gạo lứt, gạo nếp, cơm niêu, nấu cháo/canh, nấu cơm nhanh/hấp, nấu chậm/hầm, hâm nóng, giữ ấm giúp bạn chuẩn bị bữa ăn thêm tiện lợi, đa dạng.\r\n\r\nLòng nồi dạng niêu dày 1.985 mm, có 4 lớp bằng nhôm phủ chống dính an toàn cho sức khỏe\r\nHạn chế biến dạng do va đập và cháy dính thực phẩm trong quá trình nấu, gia nhiệt tốt, nấu cơm thơm ngon, dễ làm sạch.', 'Nồi Cơm Điện Tử Tefal 1-8 Lít RK736B68-696706769448500.jpg', '2023-04-21', '35'),
-- (35, 20, 'Bếp hồng ngoại đơn Magic A-38 2000W', '1890000', '1', 'Tính năng nổi bật:\r\nCông suất vùng nấu : 2000 W.\r\nBảng điều khiển : Cảm ứng.\r\nChất liệu mặt bếp : Kính Ceramic - Schott ceran (Đức).\r\nLoại nồi nấu : Tất cả loại nồi.', 'Thiết kế nhỏ gọn\r\nBếp hồng ngoại đơn Magic có thiết kế nhỏ gọn, phần tay cầm được bố trí hai bên giúp người dùng thuận tiện trong việc di chuyển bếp. Thiết bị có màu đen sang trọng, kiểu dáng chữ nhật tinh tế, giúp tăng thêm sự nổi bật cho khu vực nấu nướng của gia đình bạn.\r\n\r\nBếp hồng ngoại đơn Magic A-38 2000W có thiết kế nhỏ gọn\r\n\r\nChất liệu\r\nMặt bếp được làm từ chất liệu kính Ceramic - Schott Ceran (Đức) chịu nhiệt, khả năng chịu lực tốt và có độ bền cao. Ngoài ra chất liệu này còn có điểm mạnh về khả năng truyền nhiệt, giúp nồi, chảo nhanh nóng hơn.\r\n\r\nCông suất\r\nMagic A-38 có công suất mạnh mẽ lên đến 2000W, giúp thiết bị vận hành ổn định và gia nhiệt nhanh chóng, tiết kiệm thời gian tối đa cho người dùng.\r\n1 bếp nấu dùng được cho mọi loại nồi\r\nBếp Magic A-38 có 1 vùng nấu dùng được cho tất cả các loại nồi, đáp ứng nhu cầu nấu nướng của mọi người một cách nhanh chóng và tiện lợi.\r\n\r\nMagic A-38 có 1 vùng nấu\r\nKhóa trẻ em\r\nKhóa trẻ em có vai trò vô hiệu hóa tất cả phím điều khiển, không cho trẻ vô tình khởi động bếp gây nguy hiểm, đảm bảo an toàn cho các gia đình có trẻ nhỏ.', 'Bếp hồng ngoại đơn Magic A-38 2000W-696690243089400.jpg', '2023-04-21', '16'),
-- (36, 24, 'Lò nướng Sanaky VH-259S2D 25 lít', '1390000', '1', 'Tính năng nổi bật:\r\nDung tích: 25 Lít.\r\nCông suất: 1400W.\r\nChức năng xiên quay.', 'Thiết kế bắt mắt\r\nLò nướng SANAKY VH-259S2D có thiết kế đẹp mắt, gọn nhẹ, dễ lắp đặt và phù hợp cho mọi gian bếp. Khoang lò bằng thép không gỉ kết hợp với sơn tĩnh điện chịu nhiệt, chịu lực tốt, bền bỉ với thời gian. Lò có chức năng nướng: thịt, cá, bánh... giúp bạn chuẩn bị được các món ăn đa dạng, đáp ứng nhu cầu của các thành viên trong gia đình.\r\nGiữ nhiệt tối ưu\r\nCông suất lò nướng đạt 1400W giúp việc nướng đồ ăn nhanh chóng hơn, tiết kiệm điện năng tiêu thụ một cách hiệu quả. Lò được trang bị 2 lớp cửa kính cường lực, trong suốt, giữ nhiệt tốt, dễ dàng theo dõi quá trình nướng thức ăn. Đèn chiếu sáng bên trong lò cho phép bạn nhìn thấy đồ ăn bên trong khi trời tối hoặc không gian để lò nướng bị khuất sáng. Dung tích 25 lít, nên đáp ứng nhu cầu sử dụng hằng ngày của gia đình có từ 2 – 4 người.\r\nHẹn giờ tiện lợi\r\nLò trang bị tính năng hẹn giờ lên đến 60 phút giúp bạn cân bằng được thời gian nấu nướng và làm việc. Chức năng nướng xiên quay giúp người dùng có thể nướng nguyên cả một con gà hoặc một khối thực phẩm từ 2kg trở xuống, rất hữu ích, dùng trong những buổi tiệc với người thân hay bạn bè. ', 'Lò nướng Sanaky VH-259S2D 25 lít-696624569918300.png', '2023-04-21', '0'),
-- (37, 3, 'Quạt Lửng ASIAvina VY538790 - Xám', '666000', '1', 'Tính năng nổi bật:\r\nCông suất quạt : 55W.\r\nLưu lượng gió : 62.02 m3 / phút.\r\n3 mức điều chỉnh tốc độ.\r\nĐường kính cánh quạt : 40 cm.\r\n5 cánh quạt.', 'Thiết kế\r\nQuạt lửng Asiavina VY538790 sở hữu kiểu dáng gọn nhẹ với kích thước 440 x 450 x 642 - 1000 mm, thích hợp đặt ở mọi vị trí trong nhà. \r\n\r\nSản phẩm có khối lượng 500g, giúp người dùng có thể dễ dàng nhấc lên và di chuyển đến mọi nơi trong nhà. \r\n\r\nQuạt có màu xám nhạt, tạo điểm nhấn nhẹ nhàng cho không gian sống của bạn.\r\n\r\n\r\n\r\nQuạt lửng Asiavina VY538790 có thiết kế nhỏ gọn\r\n\r\nCông suất\r\nCông suất 55W cùng điện áp 220V-50Hz, giúp quạt vận hành ổn định và bền bỉ, tạo ra lực quay mạnh mẽ, mang đến làn gió mát bất tận cho cả gia đình.\r\n\r\nChế độ gió \r\nChế độ gió thường kết hợp với 3 mức tốc độ gió cơ bản, đáp ứng hoàn hảo nhu cầu làm mát từ nhẹ đến mạnh của người dùng.', 'Quạt Lửng ASIAvina VY538790 - Xám-696608638207400.jpg', '2023-04-21', '28'),
-- (38, 19, 'Tủ Lạnh Panasonic Inverter 300 Lít NR-BV331WGKV', '19590000', '1', 'Tính năng nổi bật:\r\nCông nghệ Nanoe-X: giảm dư lượng thuốc trừ sâu, vô hiệu hóa 99.99% vi khuẩn, khử mùi mạnh mẽ\r\nNgăn đông mềm 25L siêu lớn giữ thịt cá tươi ngon suốt 7 ngày, nấu ngay không cần rã đông\r\nNgăn rau củ giữ ẩm 90% bảo quản rau quả luôn tươi ngon\r\nCông nghệ Ag Clean tiên tiến kháng khuẩn, khử mùi đến 99,9%\r\nTrang bị ngăn lấy nước ngoài kháng khuẩn khử mùi, dung tích lớn đến 3 lít\r\nHệ thống làm lạnh vòng cung Panorama giúp thực phẩm không bị bỏng lạnh\r\nSiêu tiết kiệm điện với 3 cảm biến thông minh: Multi control, Inverter và Econavi    \r\nThiết kế phẳng tràn viền tinh tế sắc nét. Tối giản nhưng sang trọng, đẳng cấp\r\nLàm đá tự động siêu tốc, sạch khuẩn', 'Thiết kế ngăn đá dưới tiện dụng, mặt gương đen thời thượng\r\n- Tủ Lạnh Panasonic Inverter 300 Lít NR-BV331WGKV thuộc dòng tủ ngăn đá dưới vô cùng tiện dụng, kết hợp cùng thiết kế phẳng, tràn viền và mặt gương đen thời thượng, mang đến vẻ đẹp sang trọng, đẳng cấp cho không gian bếp nhà bạn. \r\n\r\n- Dung tích 300 lít thích hợp cho nhu cầu trữ thực phẩm hàng ngày của gia đình có từ 2 - 3 thành viên.\r\n\r\nThiết kế ngăn đá dưới tiện dụng, mặt kính đen thời thượng\r\n\r\nThịt cá Tươi ngon tới 7 ngày với ngăn cấp đông mềm thế hệ mới Prime Fresh+ \r\nVới ngăn đông mềm kháng khuẩn Prime Fresh+, thịt cá được bảo quản ở nhiệt độ khoảng -3 độ C, giữ trọn độ tươi ngon và dinh dưỡng của thực phẩm lên đến 7 ngày mà không cần phải rã đông trước khi chế biến. Đồng thời, ngăn này được cải tiến với dung tích 25L, lớn hơn 156% so với dòng BV360 nên bạn tha hồ dữ trữ phẩm phẩm tươi sống mua từ chợ hay siêu thị về.\r\n\r\nNgăn cấp đông mềm thế hệ mới Prime Fresh+\r\n\r\nCông nghệ nanoe™ X giúp bảo quản thực phẩm luôn sạch sẽ và khử mùi hiệu quả\r\nBằng cách giải phóng các hạt nước có kích thước nano, công nghệ nanoe ™ X giúp vô hiệu hóa tới 99,99% vi khuẩn, giảm dư lượng thuốc trừ sâu và khử mùi mạnh mẽ. Nhờ vậy, toàn bộ luồng không khí và bề mặt bên trong tủ lạnh luôn an toàn, sạch sẽ cũng như bảo quản thực phẩm được tươi ngon lâu hơn.\r\n\r\n\r\nTiết kiệm điện năng hiệu quả, thông minh cùng công nghệ Inverter, Econavi\r\nCác cảm biến Econavi hoạt động trong khi bộ vi xử lý phân tích các điều kiện sử dụng. Tiếp theo, dàn nóng Inverter điều chỉnh tốc độ quay của động cơ theo kết quả phân tích của bộ vi xử lý. Từ đó, tối ưu hóa hiệu suất làm lạnh của tủ lạnh với mức tiêu thụ điện năng thấp, giảm thiểu chi phí hằng tháng.', 'Tủ Lạnh Panasonic Inverter 300 Lít NR-BV331WGKV-696583894323200.jpg', '2023-04-21', '13'),
-- (39, 4, 'Nồi Cơm Điện Kangaroo KG822 1.2 lít', '900000', '1', 'Tính năng nổi bật:\r\nDung tích: 1.2 Lít.\r\nCông suất: 400w.\r\nChất liệu lòng nồi: Chống dính.\r\nChất liệu: Hợp kim nhôm.\r\nNguồn điện áp: 220v - 50Hz.', 'Kiểu dáng nhỏ gọn, màu sắc trẻ trung, bắt mắt, làm nổi bật không gian bếp sử dụng.\r\nNồi cấu tạo 1 mâm nhiệt nấu cơm chín nhanh tiết kiệm điện hiệu quả.\r\nLòng nồi hợp kim nhôm tráng men chống dính dày bền, nấu cơm ngon, dễ lau chùi.\r\nNồi điều khiển cơ với 2 chế độ \"cook - nấu\" và \"warm - hâm nóng\" đơn giản, dễ dùng.\r\nVan thoát hơi thông minh ổn định lượng hơi nước trong quá trình nấu\r\n ', 'Nồi Cơm Điện Kangaroo KG822 1-2 lít-696554973871200.jpg', '2023-04-21', '17'),
-- (40, 20, 'Bếp từ Philips HD4911/00', '2000000', '1', 'Tính năng nổi bật:\r\nMặt kính chịu lực, chịu nhiệt tốt.\r\n5 chế độ nấu khác nhau.\r\nCông suất hoạt động: 2100W.\r\nBảng điều khiển LED cảm ứng.', ' 5 mức công suất đáp ứng được mọi nhu cầu nấu ăn\r\n   Với 5 mức công suất được trang bị phù hợp với các nhu cầu nấu ăn khác nhau.\r\nBề mặt mát lạnh khi chạm vào.\r\nBề mặt được làm từ thủy tinh chịu lực, nhiệt nên tạo cảm giác mát lạnh khi chạm vào, đồng thời khả năng chịu lực và nhiệt tốt giúp việc nấu ăn thật thoải mái.\r\nBảng vận hành cảm ứng nhạy.\r\nBảng vận hành được trang bị cảm biến cảm ứng vô cùng nhạy, chỉ với thao tác chạm nhẹ là đã có thể tùy chỉnh được chức năng cũng như công suất và chế độ nấu.\r\nMàn hình kỹ thuật số dễ đọc.\r\nBếp được tích hợp màn hình LED giúp hiển thị nhiệt độ và chế độ nấu rõ ràng dễ hiểu', 'Bếp từ Philips HD4911-696538453395100.png', '2023-04-21', '80'),
-- (41, 24, 'Lò nướng Comet CM6510 10 lít', '604000', '1', 'Tính năng nổi bật:\r\nLò nướng bánh mì, nướng bánh.\r\nDung tích khoang lò 10 lít.\r\nCó thể dùng để nướng, rã đông.\r\nCông suất  hoạt động 1000W.\r\nThiết kế nhỏ gọn, tiện dụng.', 'Lò Nướng COMET CM6510 Tuy kích thước nhỏ, công suất 1000 W, nhưng lò có thể dùng để hâm nóng, rã đông thức ăn, nướng lượng nhỏ thực phẩm, gà nguyên con chặt góc tư, thịt bít tết đều có thể cho vào vừa vặn trong lò.\r\nLò nướng điện Comet CM6510 - Dung tích 10L chuyên dụng để nướng bánh. Đặc biệt là làm nóng hay làm giòn vỏ bánh mì, sandwich, hoặc dùng hâm nóng bánh pizza.\r\nLò có mức điều chỉnh nhiệt độ từ 100 độ C đến 250 độ C để người dùng điều chỉnh tùy theo mục đích sử dụng. Với chức năng hẹn giờ tối đa 30 phút, giúp bạn tiết kiệm thời gian, không cần phải canh lò thường xuyên.', 'lo-nuong-comet-_main_733_1020-png (2)-696523568683300.png', '2023-04-21', '34'),
-- (42, 3, 'Quạt Đứng Tefal VH442790', '1450000', '1', 'Tính năng nổi bật:\r\nCông suất: 55W.\r\n3 tốc độ gió linh hoạt.\r\nLưu lượng gió: 56 m3/ phút.\r\nĐiều chỉnh tốc độ: nút vặn.\r\nChiều cao thay đổi linh hoạt với không gian nội thất.\r\nChức năng đuổi muỗi với ngăn chứa tinh dầu chuyên dụng.', 'Quạt Tefal VH442790 được thiết kế phần thân nhỏ gọn, tạo cảm giác hiện đại, tinh tế và phù hợp đặt ở mọi vị trí trong nhà.\r\n\r\nChiều cao của quạt có thể thay đổi linh hoạt, phù hợp với nhiều đối tượng sử dụng và không gian nội thất.\r\n\r\nSản phẩm có màu xám chủ đạo, giúp tô điểm cho không gian sống của bạn thêm nổi bật và sang trọng.', 'Quạt Đứng Tefal VH442790-696489661818400.jpg', '2023-04-21', '45'),
-- (43, 19, 'Tủ lạnh Aqua Inverter 260 Lít AQR-B299MA (FB)', '11490000', '1', 'Tính năng nổi bật:\r\nTủ lạnh inverter ngăn đông mềm.\r\nTwin Inverter tiết kiệm điện hiệu quả.\r\nBảng điều khiển cảm ứng bên ngoài.\r\nKhử mùi diệt khuẩn Deo Fresh.\r\nLàm lạnh 360°.\r\nKhay kính chịu lực.', '- Với thiết kế ngăn đá dưới quen thuộc nhưng không kém phần tinh tế, gam màu đen thanh lịch, tủ lạnh Aqua ắt hẳn sẽ trở thành nội thất sang trọng, bắt mắt trong nhà bạn.\r\n- Dung tích 260 lít, tủ lạnh phù hợp với các gia đình có từ 2 đến 3 người sử dụng.\r\n\r\n- Bảng điều khiển cảm ứng ngoài tiện lợi, sang trọng giúp thiết lập chế độ và chức năng dễ dàng mà không cần mở tủ.', 'Tủ lạnh Aqua Inverter 260 Lít AQR-B299MA (FB)-696472144046100.png', '2023-04-21', '39'),
-- (44, 4, 'Nồi Cơm Điện Comet CM8022 2.8 lít', '769000', '1', 'Tính năng nổi bật:\r\nDung tích: 2.8 Lít.\r\nCông suất: 700w.\r\nChất liệu lòng nồi: Chống dính.\r\nChất liệu: Phụ lớp chống dính cao cấp.\r\nNguồn điện áp: 220v - 50Hz.', 'Nồi cơm điện Comet CM8022 gây ấn tượng với thiết kế đơn giản và lạ mắt, góp phần tạo nên nét đẹp cho nội thất phòng bếp. Nồi có dung tích 2.8L, đây là sự lựa chọn hoàn hảo dành cho gia đình 6-8 người.\r\nLòng nồi làm bằng hợp kim chống dính với độ bền cao và an toàn cho sức khỏe người dùng. Lòng nồi chống dính cả 2 mặt trong và ngoài giúp nấu cơm được tơi ngon, không cháy khét, dễ dàng lau chùi sau khi dùng.\r\nNồi có một mâm nhiệt ở đáy với đường kính lớn, tỏa nhiệt đều giúp cơm chín nhanh, không bị nhão.', 'Nồi Cơm Điện Comet CM8022 2-8 lít-696448975211800.png', '2023-04-21', '20'),
-- (45, 20, 'Bếp Từ SMEG SIM693WLDR', '92390000', '1', 'Tính năng nổi bật:\r\nBếp từ đa vùng nấu linh hoạt, có thể kết hợp 2 vùng nấu thành một vùng nấu lớn, dùng đa dạng kích cỡ nồi.\r\nThương hiệu Smeg của Ý, sản xuất tại Ý.\r\nTổng công suất lớn 10800W, nấu thức ăn chín nhanh. \r\n9 mức nhiệt, tùy chỉnh linh hoạt nhiệt độ cho từng món ăn, đảm bảo hương vị bữa ăn thơm ngon. \r\nChức năng nhận diện đáy nồi, nhiệt chỉ truyền đến vùng cần nấu, không gây thất thoát nhiệt và tiết kiệm điện.\r\nTính năng ninh/hầm sử dụng tiện lợi, tiết kiệm điện.\r\nMặt bếp bằng kính cường lực Ceramic - Smeg cao cấp của Ý, chịu lực chịu nhiệt tốt, không lo trầy xước, sốc nhiệt. \r\nBảng điều khiển cảm ứng trượt siêu nhạy, dễ dàng sử dụng kể cả người lớn tuổi. \r\nTính năng an toàn: Khóa trẻ em, bảo vệ khi bếp khởi động đột ngột, tự ngắt khi quá nhiệt hoặc bếp tràn.', 'Sản phẩm được trang bị đa vùng nấu linh hoạt, có thể kết hợp 2 vùng nấu thành một vùng nấu lớn, dùng đa dạng kích cỡ nồi. Chức năng tự nhận diện nồi và vùng nấu tiện lợi, giúp người dùng dễ dàng sử dụng mà không gặp trở ngại nào\r\n\r\nTổng công suất lớn 10800W\r\nThiết bị có tổng công suất lớn 10800W, cùng công suất đơn 2100/ 3700W và ghép là 3700/ 5500W. Giúp thức ăn chín nhanh hơn, rút ngắn thời gian chờ đợi cho người dùng trong những lúc bận rộn. Chức năng nhận diện đáy nồi, nhiệt chỉ truyền đến vùng cần nấu, không gây thất thoát nhiệt và tiết kiệm điện năng tiêu thụ.\r\nBếp từ có bảng điều khiển cảm ứng trượt siêu nhạy, giúp người dùng thao tác dễ dàng kể cả người lớn tuổi. Chức năng hẹn giờ thông minh, hỗ trợ bạn chủ động hơn trong việc nấu nướng. ', 'Bếp Từ SMEG SIM693WLDR-696433470235600.jpg', '2023-04-21', '27'),
-- (46, 24, 'Lò Nướng TOSHIBA TL-MC40EZF(GR)', '3490000', '1', 'Tính năng nổi bật:\r\nCông suất lò : 1800W.\r\nDung tích lò : 40 Lít.\r\nNhiệt độ nướng : 70 - 230 độ C.\r\nHẹn giờ : Tối đa 60 phút.\r\nThiết kế khoang lò nướng hình kim cương.\r\nQuạt đối lưu giúp tản nhiệt đều và liên tục trong khoang lò.', 'Lò nướng Toshiba TL-MC40EZF(GR) có kích thước tương đối nhỏ gọn 496 x 465 x 415mm. Kết hợp cùng thiết kế hiện đại, và tông màu đèn chủ đạo giúp không gian bếp trở nên sang trọng, cũng như tăng thêm tính thẩm mỹ cho ngôi nhà bạn.\r\nVỏ máy bên ngoài của thiết bị được làm từ thép không gỉ, bền bỉ và dễ lau chùi sạch sẽ. Cửa kính 2 lớp cường lực chịu nhiệt, chịu nhiệt tốt, không gây nguy hiểm trong quá trình sử dụng. Phần thiết kế tay cầm đơn giản, giúp người dùng dễ dàng đóng/ mở khi sử dụng. \r\nKhoang lò có thiết kế hình kim cương, có khả năng khuếch tán và phản nhiệt đều giúp thức ăn chín giòn. Đồng thời, dung tích của  khoang lò tương đối lớn lên đến 40 lít. Có thể nướng được nhiều thực phẩm cùng một lúc, phù hợp với những gia đình có từ 4 đến 5 thành viên, đáp ứng tốt nhu cầu nấu nướng trong những bữa ăn hàng ngày. \r\nLò nướng được trang bị công suất mạnh mẽ 1800W, với nhiệt độ nướng ở mức 70 - 230 độ C. Cùng với đó là quạt đối lưu giúp tản nhiệt đều, và liên tục trong khoang lò. Có khả năng nướng chín thức ăn nhanh chóng và chín đều các mặt, nhưng vẫn giữ được hương vị thơm ngon, lớp vàng giòn trên bề mặt thực phẩm', 'Lò Nướng TOSHIBA TL-MC40EZF(GR)-696401328253500.jpg', '2023-04-21', '0'),
-- (47, 3, 'Quạt đứng Mitsubishi LV16-RA CY-GY-Xám Đậm', '2780000', '1', 'Tính năng nổi bật:\r\nCông suất : 48W.\r\nChân đế lớn giúp quạt đứng vững chắc chắn.\r\nLồng quạt đan khít, an toàn khi tiếp xúc gần.\r\nĐiều chỉnh độ cao quạt theo nhu cầu sử dụng.\r\nThiết kế cánh quạt lớn giúp làm mát diện rộng', 'Quạt đứng Mitsubishi LV16-RA CY-GY-Xám Đậm có kiểu dáng thon gọn, không chiếm quá nhiều diện tích. Kết hợp cùng màu sắc trang nhã, phù hợp với mọi không gian nội thất của mỗi gia đình. \r\nThiết bị được làm từ chất liệu nhựa cao cấp, bền đẹp. Phần chân đế bên dưới quạt tương đối lớn, có khả năng đứng vững trên mọi mặt phẳng mà không lo bị đổ ngã. Lồng quạt đan khít, chắc chắn đảm bảo an toàn cho người dùng khi tiếp xúc với quạt ở vị trí gần.\r\nSản phẩm có công suất lớn lên đến 48W, với 3 cánh quạt dài 40cm tạo được luồng gió mát nhanh chóng và hiệu quả ở không gian rộng. Ngoài ra, bạn còn có thể điều chỉnh độ cao quạt theo nhu cầu sử dụng vô cùng tiện lợi.\r\nQuạt đứng có 3 tốc độ gió khác nhau từ nhẹ đến mạnh. Dựa theo nhu cầu sử dụng của bản thân hoặc các thành viên trong gia đình, mà từ đó bạn có thể chỉnh tốc độ gió phù hợp. ', 'Quạt đứng Mitsubishi LV16-RA CY-GY-Xám Đậm-696378919437100.jpg', '2023-04-21', '33'),
-- (48, 19, 'Tủ Lạnh Toshiba Inverter 180 Lít GR-B22VU (UKG)', '5890000', '1', 'Tính năng nổi bật:\r\nDung tích 180 lít.\r\nInverter tiết kiệm điện.\r\nNgăn cấp đông mềm.', 'Với kiểu tủ ngăn đá trên, chiếc tủ lạnh Toshiba Inverter 180 lít GR-B22VU(UKG) được thiết kế nhỏ gọn nhưng vẫn toát lên vẻ đẹp hiện đại bởi tông màu đen tuyền sang trọng. Dễ dàng đặt ở bất kì vị trí nào trong nhà, từ phòng khách đến phòng bếp  .\r\nChiếc tủ lạnh Toshiba này chỉ sở hữu dung tích 180 lít, phù hợp với gia đình nhỏ tầm 2 – 3 người nhưng sẽ là nội thất bắt mắt trong không gian nhà bạn.\r\nNhờ có sự hỗ trợ của công nghệ biến tần Inverter, tủ lạnh Toshiba GR-B22VU UKG sẽ giúp bạn bớt lo lắng về tiền điện mỗi tháng, vì mang lại khả năng tiết điện điện hiệu quả so với tủ lạnh thông thường.   Công nghệ biến tần này sẽ kiểm soát sự hoạt động của máy nén giúp duy trì nhiệt độ bên trong tủ và hạn chế tiếng ồn đến mức tối đa.  ', 'Tủ Lạnh Toshiba Inverter 180 Lít GR-B22VU (UKG)-696199736887200.jpg', '2023-04-21', '0'),
-- (49, 4, 'Nồi Cơm Điện Sunhouse SHD8125 1.8 lít', '695000', '1', 'Tính năng nổi bật:\r\nDung tích: 1.8 Lít.\r\nCông suất: 700W.\r\nChất liệu lòng nồi: Hợp kim nhôm.\r\nChất liệu vỏ: Tôn sơn cách điện.\r\nNguồn điện áp: 220v - 50Hz.', 'Nồi cơm điện 1.8l Sunhouse SHD8125 có nắp vung rời bằng inox sáng bóng, thân nồi bằng tôn sơn cách điện màu vàng đồng, phủ nhũ chống gỉ giúp nồi luôn sáng bóng như mới, tạo điểm nhấn bắt mắt, sang trọng cho căn bếp nhà bạn. Dung tích 1.8L phù hợp với gia đình 4 – 6 thành viên.\r\nLòng nồi làm từ chất liệu hợp kim nhôm, chắc chắn, chống dính giúp cơm không bị cháy khét khi nấu và rất dễ chùi rửa. Lòng nồi dày, dẫn nhiệt tốt, giúp nấu cơm nhanh hơn, giữ ấm lâu hơn và không sinh ra chất độc, đảm bảo an toàn sức khỏe cho cả gia đình.\r\nNồi cơm điện Sunhouse được trang bị một mâm nhiệt lớn cùng công suất nồi 900W giúp nhiệt tỏa đều làm cơm chín nhanh và thơm ngon hơn.\r\nNồi cơm có 2 chức năng Nấu và Giữ ấm, được điều khiển bằng nút gạt tiện lợi trên phần thân. Ngoài ra, các bộ phận dễ dàng tháo lắp nên vệ sinh được sạch sẽ hơn.', 'Nồi Cơm Điện Sunhouse SHD8125 1-8 lít-696165773900800.jpg', '2023-04-21', '15'),
-- (50, 20, 'Bếp Gas Electrolux ETG7256GKR', '2190000', '1', 'Tính năng nổi bật:\r\nBếp ga đôi để bàn linh hoạt sắp xếp trong không gian bếp.\r\nLượng ga tiêu thụ 0.22 kg/h/lò, công suất mỗi bên 3 kW/h.\r\nHệ thống đánh lửa Magneto có độ bền cao.\r\nĐầu đốt bằng đồng bền bỉ, không làm đen đáy nồi. ', 'Electrolux ETG7256GKR có kích thước 70 x 41 x 14.5 cm, trọng lượng 9.8kg. Sản phẩm sở hữu thiết kế hiện đại dạng bếp lắp dương với 2 bếp nấu tiện lợi. Mặt bếp được làm bằng kính cường lực sáng bóng giúp tăng tính thẩm mỹ cho gian bếp gia đình.\r\nBếp gas đôi để bàn linh hoạt sắp xếp trong không gian bếp. Sản phẩm được điều khiển bằng núm vặn để người dùng có thể thuận tiện sử dụng và điều chỉnh lửa tăng hoặc giảm tùy ý khi nấu. \r\nElectrolux ETG7256GKR được trang bị hệ thống đánh lửa Magneto có độ bền cao. Ưu điểm của hệ thống này là dùng được lâu bền, ít bị hư hỏng, dễ sử dụng. ', 'Bếp Gas Electrolux ETG7256GKR-696136662405600.png', '2023-04-21', '0'),
-- (51, 24, 'Lò nướng thủy tinh Sunhouse SH-416 12 lít', '920000', '1', 'Tính năng nổi bật:\r\nDung tích khoang lò : 12 Lít.\r\nKhí nóng đối lưu giúp thức ăn chín đều.\r\nCài đặt thời gian-nhiệt độ nấu dễ dàng.\r\nCông suất tiêu thụ tối đa : 1300W.\r\nBảo hành 12 Tháng.', 'Lò Nướng SUNHOUSE SH-416 thiết kế bằng chất liệu thủy tinh giúp dễ lau chùi. Dung tích 12 lít giúp đáp ứng được các món nướng phổ biến trong gia đình bạn.\r\nLò nướng Sunhouse SH416 điều khiển nhiệt độ được thiết kế bằng nút vặn nhẹ nhàng, giúp cho bạn dễ dàng khi sử dụng kết hợp với nắp rời thuận tiện cho việc vệ sinh lò.\r\nLò Nướng SUNHOUSE SH-416  sử dụng công nghệ làm nóng bằng đèn Halogen hiện đại giúp cho thức ăn luôn chín đều và thơm ngon', 'Lò nướng thủy tinh Sunhouse SH-416 12 lít-696115838705900.png', '2023-04-21', '19'),
-- (52, 3, 'Quạt treo Yanfan TC408', '500000', '1', 'Tính năng nổi bật:\r\nCông suất 47w.\r\nKiểu dáng chắc chắn, sang trọng.\r\nKích thước cánh 400mm.\r\n3 tốc độ gió cho bạn lựa chọn.\r\nXuất xứ Việt Nam.', 'Quạt Treo YANFAN TC408 Công suất 47W tăng cường khả năng làm mát và lưu thông khí tốt hơn.Thiết kế dễ lắp đặt, nhẹ bền và an toàn, góc quay 360 độ, giúp tỏa gió mát khắp phòng.\r\nQuạt có 3 tốc độ gió từ nhẹ đến mạnh phù hợp cho sức khỏe của cả người lớn và trẻ nhỏ.', 'Quạt treo Yanfan TC408-696096496747200.jpg', '2023-04-21', '24'),
-- (53, 19, 'Tủ Lạnh Panasonic Inverter 234 Lít NR-TV261BPAV', '10390000', '1', 'Tính năng nổi bật:\r\nDung tích 306 lít.\r\nCông nghệ Blue Ag diệt khuẩn 99,99%.\r\nNgăn trữ đông riêng tinh thể bạc.\r\nNgăn ướp lạnh nhanh 2*c Extra cool zone.\r\nInverter+ Cảm biến Econavi tiết kiệm điện .', 'Tủ Lạnh Panasonic Inverter 234 Lít NR-TV261BPAV sở hữu màu xanh độc đáo, kết hợp cùng các đường nét hài hòa tinh tế, phù hợp với nhiều không gian nội thất khác nhau.\r\n\r\nChất liệu bền bỉ với khay kính chịu lực lên đến 150kg, nhờ đó bạn có thể đặt nồi, các món đồ nặng hoặc chai lọ lớn mà không nhất thiết phải chia ra các hộp, khay thực phẩm nhỏ.\r\n\r\nCửa tủ lạnh được làm từ chất liệu thép giúp bảo vệ tủ lạnh tốt hơn trong quá trình vận chuyển và sử dụng.\r\nTủ Lạnh Panasonic Inverter 234 Lít NR-TV261BPAV có khả năng diệt khuẩn vượt trội lên đến 99,99% nhờ công nghệ Blue Ag+.\r\n\r\nCông nghệ Blue Ag+ hoạt động theo cơ chế sử dụng ánh sáng xanh kích hoạt tinh thể bạc Ag+ để tạo ra các gốc OH- tự do. Các gốc OH- này kết hợp với gốc hydro có trong vi khuẩn và chuyển hóa thành nước, tiêu diệt triệt để vi khuẩn gây bệnh.\r\nNgăn mát Extra Cool Zone với nhiệt độ 2 độ C, cùng nắp kháng khuẩn đặc biệt giúp làm lạnh nhanh chóng và kháng khuẩn ưu việt. ', 'Tủ Lạnh Panasonic Inverter 234 Lít NR-TV261BPAV-696067933717400.jpg', '2023-04-21', '26'),
-- (54, 4, 'Nồi Cơm Điện Panasonic SR-CL188WRA 1.8 lít', '2390000', '1', 'Tính năng nổi bật:\r\nDung tích: 1.8 L.\r\nCông suất: 765 W.\r\nChất liệu lòng nồi: Lớp phủ chống dính và Almite bên ngoài.\r\nChất liệu vỏ: Tùy mẫu sản xuất.\r\nNguồn điện áp: 220v - 50Hz.', 'Nồi cơm điện Panasonic SR-CL188WRA có kiểu dáng đơn giản, cùng màu trắng bắt mắt, là điểm nhấn nổi bật cho không gian bếp nhà bạn. Sản phẩm thích hợp phục vụ cho nhu cầu nấu nướng của chị em nội trợ, đặc biệt là đối với những người bận rộn. Nồi có dung tích 1,8 lít có khả năng nấu được 1.5 kg gạo, hoàn toàn đáp ứng mọi nhu cầu nấu ăn của gia đình từ 4 - 6 thành viên.', '6843_noi_com_dien_panasonic_1_8_lit_sr_cl188wra_1-695990659915300.jpg', '2023-04-21', '58'),
-- (55, 19, 'Tủ Lạnh Samsung Inverter 680 Lít RS62R5001M9/SV', '22900000', '1', 'Tính năng nổi bật:\r\nCông nghệ Digital Inverter.\r\nCông nghệ làm lạnh dạng vòm.\r\nLoại bỏ mùi hôi khử mùi than hoạt tính.\r\nTủ lạnh Side by Side sang trọng, đẳng cấp.', 'Tủ lạnh SAMSUNG Inverter 680 lít RS62R5001M9/SV Lựa chọn hoàn hảo cho mọi phong cách thiết kế nội thất tủ lạnh Samsung Side by Side gây ấn tượng với thiết kế phẳng, góc cạnh , nâng tầm đẳng cấp cho toàn bộ gian bếp.\r\nCông nghệ Digital Inverter của Samsung tự động điều chỉnh 5 cấp độ hoạt động của động cơ, tùy theo nhu cầu sử dụng thực tế. Công nghệ Digital Inverter giúp tiết kiệm điện năng, giảm tiếng ồn và kéo dài tuổi thọ động cơ lên đến 21 năm (chứng nhận bởi VDE).\r\nSức mạnh than hoạt tính mạnh mẽ làm sạch không khí bên trong tủ và loại bỏ các vi khuẩn gây mùi khó chịu; giữ không khí trong lành, thức ăn trọn vị.\r\nHộp Rau Quả với thiết kế không gian lớn mang đến khả năng dự trữ được nhiều rau củ và trái cây hơn, giúp bạn dễ dàng tìm thấy nguồn thực phẩm tươi mát và giàu dinh dưỡng chỉ trong một nơi duy nhất. Thỏa mái thưởng thức các loại rau quả đầy tươi ngon, mọng nước mọi lúc mà không phải chiếm dụng không gian phòng bếp hơn nữa.\r\n', 'Tủ Lạnh Samsung Inverter 680 Lít RS62R5001M9-695964529038100.png', '2023-04-21', '35'),
-- (56, 20, 'Bếp gas đôi Duxton DG-888', '1790000', '1', 'Khung và mặt bếp được làm bằng thép sơn tĩnh điện hạn chế gỉ sét, mặt trước dán tem nhãn decal.\r\nKiềng rời bằng thép tráng men hạn chế gỉ sét, dễ dàng tháo rời vệ sinh chùi rửa.\r\nMâm rời bằng inox sáng bóng dễ dàng tháo rời để vệ sinh chùi rửa.\r\nĐiếu inox 304 không gỉ sét.\r\nỐng dẫn gas bằng thép sơn tĩnh điện.', 'Bếp gas đôi Duxton DG-888 có kích thước 700 x 420 x 160mm tương đối nhỏ gọn, không chiếm quá nhiều diện tích. Kết hợp cùng tông màu đỏ và đen chủ đạo, làm tăng thêm tính thẩm mỹ, hiện đại cho không gian bếp của mỗi gia đình người Việt.\r\nSản phẩm có thiết kế 2 bếp nấu tiện lợi, giúp người dùng cùng lúc có thể nấu được nhiều loại món khác nhau, đáp ứng được mọi nhu cầu cho bữa ăn của mỗi thành viên trong gia đình.\r\nMặt bếp bằng thép, được phủ thêm lớp sơn tĩnh điện mang lại vẻ ngoài sáng bóng, chịu lực, chịu nhiệt tốt và dễ lau chùi sạch sẽ. Kiềng bếp được làm từ thép tráng men không bị hoen gỉ, hoặc gãy khi sử dụng trong thời gian dài. Đầu đốt thì bằng đồng dày dặn, chắc chắn không bị bào mòn và dẫn nhiệt tốt.\r\nBếp gas có hệ thống đánh lửa Magneto, có tác dụng phát ra tia lửa năng lượng điện kết hợp với khí gas. Từ đó, tạo ra được tia lửa nhanh chóng, có thể dùng được bền bỉ lâu dài, ít hư hỏng và dễ dàng sử dụng. Giúp quá trình nấu nướng tốn ít thời gian, và công sức hơn rất nhiều.', 'Bếp gas đôi Duxton DG-888-695930000926400.png', '2023-04-21', '0'),
-- (57, 20, 'Bếp từ đơn Toshiba IC-20S2PV', '1600000', '1', 'Tính năng nổi bật:\r\nBếp điện từ đơn gọn đẹp, có 1 vùng nấu đặt được trên bàn ăn.\r\nBếp điện từ có Công suất 2000W giúp nấu ăn nhanh chóng.\r\nMặt kính Ceramic cao cấp, chịu lực chịu nhiệt tốt, dễ vệ sinh.\r\nĐiều khiển cảm ứng trực tiếp tiện lợi, thao tác chính xác.\r\nBếp có 4 chế độ nấu cài đặt sẵn và chức năng hẹn giờ tiện dụng.\r\nKhóa trẻ em, tính năng tự động ngắt an toàn khi sử dụng.', 'Bếp điện từ TOSHIBA IC-20S2PV thiết kế hiện đại, gam màu đen sang trọng, nổi bật kết hợp hoa văn tinh tế, đẹp mắt. Mặt bếp được làm từ kính Ceramic cường lực, chịu được nhiệt độ cao, hạn chế nứt vỡ, biến dạng khi đun nấu, đảm bảo an toàn cho người dùng.\r\n\r\nMặt kính đen bóng, chống trầy xước, vệ sinh dễ dàng mà không làm mất đi độ sáng đẹp của bếp. Kích thước gọn nhẹ nên sẽ thuận tiện khi di chuyển, lắp đặt.\r\nBếp có công suất nấu mạnh mẽ giúp bạn chế biến các món ăn một cách nhanh chóng, tiết kiệm được rất nhiều thời gian và điện năng tiêu thụ trong quá trình đun nấu. Bên cạnh đó bếp được trang bị nhiều chế độ nấu: chiên, nấu lẩu, xào và hầm.... mang lại những món ăn đa dạng, hấp dẫn, đáp ứng được nhu cầu ăn uống của các thành viên trong gia đình.\r\n', '10048897-bep-dien-tu-toshiba-ic-20s2pv-1-695858531698800.jpg', '2023-04-21', '12'),
-- (58, 24, 'Lò nướng Philips HD2582', '900000', '1', 'Tính năng nổi bật:\r\nCông suất : 830  W.\r\nMàu sắc : Đen.\r\nVật liệu thân chính :Nhựa.\r\nSố mức nướng vàng :8.\r\nTần số :50-60  Hz.', 'Lò Nướng PHILIPS HD2582 với 2 khe nướng lớn, độ rộng thay đổi cho nhiều kích cỡ bánh mì. Nhờ có tính năng tự điều chỉnh vào giữa, bánh mì được giữ ở giữa khe nướng để nướng vàng đồng đều ở cả hai bên.\r\nVỉ hâm nóng bánh bao gắn kèm để làm nóng các loại bánh bao, bánh ngọt và ổ bánh mì ưa thích một cách dễ dàng.', 'Lò nướng Philips HD2582-695827920397500.png', '2023-04-21', '69'),
-- (59, 20, 'Lò Nướng Teka 6415 SS', '15649200', '1', 'Tính năng nổi bật:\r\nTổng công suất : 2615W.\r\nTổng dung tích lò : 70 lít.\r\n6 chức năng nấu ăn.\r\nCửa kính hai lớp có thể tháo rời.\r\nChất liệu khoang lò : tráng men.\r\nĐèn Halogen làm sáng bên trong khoang lò.', 'Lò nướng Teka 6415 SS sở hữu thiết kế nhỏ gọn với kích thước: ngang 59.5cm - sâu 53.7+2.2cm - cao 59.5cm, phù hợp đặt ở mọi vị trí khác nhau trong bếp. Sản phẩm có màu đen chủ đạo, tay cầm và bảng điều khiển màu bạc, tạo nên điểm nhấn và tăng vẻ sang trọng cho không gian nấu nướng của bạn.\r\nTeka 6415 SS được làm bằng chất liệu thép không gỉ có độ bền cao, chống mài mòn, ít bị trầy xước, chống bám dấu vân tay.\r\n\r\nKhoang lò được tráng men giúp thức ăn không bị bám dính, dễ dàng vệ sinh sau khi sử dụng.\r\n\r\nCửa kính 2 lớp có thể tháo rời, giúp người dùng thuận tiện lau chùi.\r\nDung tích tổng 70 lít, trong đó có thể sử dụng 65 lít, và 6 chức năng nấu ăn, cho phép bạn nướng gà, vịt nguyên con hay chế biến lượng thức ăn lớn, đáp ứng nhu cầu sử dụng đa dạng của gia đình bạn.', 'Lò Nướng Teka 6415 SS-695797835214700.jpg', '2023-04-21', '36'),
-- (60, 24, 'Lò nướng Electrolux EOT30MXC 30 lít', '2090000', '1', 'Tính năng nổi bật:\r\nDung tích: 30 lít.\r\nCông suất: 1800 W.\r\nChất liệu lò: Khoang lò thép không gỉ, vỏ thép phủ sơn tĩnh điện.\r\nCông nghệ làm nóng: Làm nóng điện trở.', 'Lò Nướng ELECTROLUX EOT30MXC với đèn chiếu sáng giúp bạn dễ quan sát quá trình nướng thực phẩm bên trong khoang lò.\r\nELECTROLUX EOT30MXC có xiên quay cho phép bạn nướng gà, vịt nguyên con tiện lợi, thực phẩm chín đều, ngon.\r\nTạo luồng gió luân chuyển nhiệt độ khắp trong khoang lò làm chín thực phẩm đều, ngon\r\nĐiều khiển núm vặn đơn giản, có chỉ dẫn dễ hiểu, tiện thao tác với mọi người dùng.', 'Lò nướng Electrolux EOT30MXC 30 lít-695771201948200.jpg', '2023-04-21', '29'),
-- (61, 3, 'Quạt sạc Comet ARF01D113', '2305000', '1', 'Tính năng nổi bật:\r\nCông suất: 10W.\r\nPin Lithium cao cấp-7500mAh.\r\nThời gian sạc: 2.5-3 giờ/ Thời gian hoạt động 5-24 giờ.\r\nChế độ ngắt khi sạc đầy.', 'Quạt sạc AC ARF02D113 có thiết kế nhỏ gọn, đẹp mắt, dễ dàng mang theo đi du lịch, dã ngoại ngoài trời, sử dụng trong quán café... Thân quạt và cánh quạt được sản xuất từ hợp kim aluminium rất chắc chắn và được phủ sơn tĩnh điện có khả năng kháng nước chuẩn IPX4, có độ bền cao. Quạt được tích hợp thêm cổng sạc bằng đầu USB có thể sử dụng như cục sạc dự phòng cho điện thoại khi dế yêu của bạn hết pin và đang có nhu cầu sử dụng ngay.', 'Quạt sạc Comet ARF01D113-695725199260100.png', '2023-04-21', '18'),
-- (62, 4, 'Nồi Cơm Điện Sunhouse SHD8607W 1.8 lít', '969000', '1', 'Tính năng nổi bật:\r\nDung tích: 1.8 Lít.\r\nCông suất: 700W.\r\nChất liệu lòng nồi: Hợp kim nhôm phủ chống dính Whitford (USA) .\r\nChất liệu vỏ: Nhựa PP siêu bền.\r\nNguồn điện áp: 220v - 50Hz.', 'Nồi cơm điện 1.8L Sunhouse SHD8607W được thiết kế với những đường nét tinh tế, hiện đại, góp phần nổi bật cho không gian bếp nhà bạn. Nhằm mang đến sự thuận tiện khi sử dụng, nên nồi được trang bị nắp gài tự động. Nắp có tác dụng hạn chế nhiệt lượng thất thoát trong quá trình nấu, cơm sẽ chín đều, mềm dẻo hơn so với nồi nắp rời. Tay cầm được tích hợp ngay trên nắp, giúp việc di chuyển hay đặt để nồi trở nên linh hoạt, dễ dàng.', 'Nồi Cơm Điện Sunhouse SHD8125 1-8 lít-695680555474200.jpg', '2023-04-21', '90'),
-- (69, 19, 'tủ lạnh', '10000000', '1', 'tủ lạnh tốt', 'tủ lạnh tốt', 'Tủ Lạnh Samsung Inverter 680 Lít RS62R5001M9-733787804658300.png', '2023-04-29', '12'),
-- (70, 3, 'quạt', '200000', '1', 'quạt tốt', 'quạt chất lượng', 'Quạt lửng Yanfan L828-736298647116700.jpg', '2023-04-29', '10');

-- -- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE  [dbo]. [review] (
  [id] [varchar](255) NOT NULL,
  [name] [varchar](255) NOT NULL,
  [email] [varchar](255) NOT NULL,
  [product_id] [varchar](255) NOT NULL,
  [content] [varchar](255) NOT NULL,
  [created] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `review`
--

-- INSERT INTO `review` (`id`, `name`, `email`, `product_id`, `content`, `created`) VALUES
-- (6, 'tinh', 'tinh@gmail.com', 59, 'sản phẩm đa dạng', '2023-04-28'),
-- (7, 'hoà', 'hoa@gmail.com', 57, 'sản phẩm bền', '2023-04-28'),
-- (8, 'nam', 'nam@gmail.com', 43, 'giá cả ưu đãi', '2023-04-28'),
-- (10, 'quý', 'phuquy1106@gmail.com', 62, 'sản phẩm rất tốt', '2023-04-29'),
-- (11, 'quy', 'quy@gmail.com', 60, '12312321', '2023-04-29'),
-- (12, 'phú quý', 'quy@gmail.com', 69, 'sản phẩm tốt', '2023-04-29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE [dbo]. [transactions] (
  [id] [varchar](11) NOT NULL,
  [status] [varchar](255) NOT NULL,
  [user_session] [varchar](255) NOT NULL,
  [user_name] [varchar](255) NOT NULL,
  [user_mail] [varchar](255) NOT NULL,
  [user_phone] [varchar](255) NOT NULL,
  [address] [varchar](255) NOT NULL,
  [amount] [varchar](255) NOT NULL,
  [payment] [varchar](255) NOT NULL,
  [message] [varchar](255) NOT NULL,
  [created] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

-- INSERT INTO `transactions` (`id`, `status`, `user_session`, `user_name`, `user_mail`, `user_phone`, `address`, `amount`, `payment`, `message`, `created`) VALUES
-- (19, 'Đã xác nhận', 'q', 'fdsfds', 'sda@d', '4231132', 'fsdafa', '3374000.0', '0', 'sadfsa', '2023-04-28'),
-- (20, 'Đã xác nhận', 'phuquy123', 'phú quý', 'phuquy1106@gmail.com', '0931948893', 'đà nẵng', '1.938E7', '0', 'giao hàng', '2023-04-29'),
-- (21, 'Đã xác nhận', 'nguyenphuquy', 'phú quý', 'quy@gmail.com', '0931948893', 'đà nẵng', '8.98901E7', '0', 'giao hàng nhanh', '2023-04-29'),
-- (22, 'Chưa xác nhận', 'namfb', 'quy', 'quy@gmail.com', '0123456789', '321312', '1620000.0', '0', '321312', '2023-05-03'),
-- (23, 'Chưa xác nhận', 'namfb', 'quý', 'quy@gmail.com', '0123456798', 'ewqeq', '2.10297E8', '0', 'ewqewq', '2023-05-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE [dbo]. [users] (
  [id] [varchar](11) NOT NULL,
  [name] [varchar](255) NOT NULL,
  [email] [varchar](255) NOT NULL,
  [phone] [varchar](255) NOT NULL,
  [username] [varchar](255) NOT NULL,
  [password] [varchar](255) NOT NULL,
  [created] [varchar](255) NOT NULL,
  [role] [varchar](255) NOT NULL
);

--
-- Đang đổ dữ liệu cho bảng `users`
--

-- INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `password`, `created`, `role`) VALUES
-- (37, 'quy2', 'quy@fdf1', '3928943291dsa', 'q', '25f9e794323b453885f5181f1b624d0b', '2023-04-26', 'User'),
-- (38, 'Quý Admin', '', '', 'quyadmin', '25f9e794323b453885f5181f1b624d0b', '2023-04-26', 'Admin'),
-- (47, 'tinh', 'tinh@gmail.com', '0123456789', 'tinhhayhat', '25f9e794323b453885f5181f1b624d0b', '2023-04-28', 'User'),
-- (48, 'nam21', 'nam@gmail.com', '0123789456', 'namfb', '25f9e794323b453885f5181f1b624d0b', '2023-04-28', 'User'),
-- (49, 'tuấn', 'tuan@gmail.com', '0789456123', 'tuanpro', '25f9e794323b453885f5181f1b624d0b', '2023-04-28', 'User'),
-- (50, 'truong', 'truong@gmail.com', '0213456789', 'truonglienminh', '25f9e794323b453885f5181f1b624d0b', '2023-04-28', 'User'),
-- (51, 'quý', 'quy123@gmail.com', '0931948893', 'phú quý', '25f9e794323b453885f5181f1b624d0b', '2023-04-29', 'User'),
-- (52, 'phú quý', 'phuquy1106@gmail.com', '0931948893', 'phuquy123', '25f9e794323b453885f5181f1b624d0b', '2023-04-29', 'User'),
-- (53, 'phú quy', 'quy@gmail.com', '0931948893', 'nguyenphuquy', '25f9e794323b453885f5181f1b624d0b', '2023-04-29', 'User');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
-- ALTER TABLE `banner`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Chỉ mục cho bảng `boardnew`
-- --
-- ALTER TABLE `boardnew`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Chỉ mục cho bảng `catalog`
-- --
-- ALTER TABLE `catalog`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Chỉ mục cho bảng `ordered`
-- --
-- ALTER TABLE `ordered`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `transaction_id` (`transaction_id`),
--   ADD KEY `product_id` (`product_id`);

-- --
-- -- Chỉ mục cho bảng `product`
-- --
-- ALTER TABLE `product`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `catalog_id` (`catalog_id`);

-- --
-- -- Chỉ mục cho bảng `review`
-- --
-- ALTER TABLE `review`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `product_id` (`product_id`);

-- --
-- -- Chỉ mục cho bảng `transactions`
-- --
-- ALTER TABLE `transactions`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- Chỉ mục cho bảng `users`
-- --
-- ALTER TABLE `users`
--   ADD PRIMARY KEY (`id`);

-- --
-- -- AUTO_INCREMENT cho các bảng đã đổ
-- --

-- --
-- -- AUTO_INCREMENT cho bảng `banner`
-- --
-- ALTER TABLE `banner`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

-- --
-- -- AUTO_INCREMENT cho bảng `boardnew`
-- --
-- ALTER TABLE `boardnew`
--   MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

-- --
-- -- AUTO_INCREMENT cho bảng `catalog`
-- --
-- ALTER TABLE `catalog`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

-- --
-- -- AUTO_INCREMENT cho bảng `ordered`
-- --
-- ALTER TABLE `ordered`
--   MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

-- --
-- -- AUTO_INCREMENT cho bảng `product`
-- --
-- ALTER TABLE `product`
--   MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

-- --
-- -- AUTO_INCREMENT cho bảng `review`
-- --
-- ALTER TABLE `review`
--   MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

-- --
-- -- AUTO_INCREMENT cho bảng `transactions`
-- --
-- ALTER TABLE `transactions`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

-- --
-- -- AUTO_INCREMENT cho bảng `users`
-- --
-- ALTER TABLE `users`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

-- --
-- -- Các ràng buộc cho các bảng đã đổ
-- --

-- --
-- -- Các ràng buộc cho bảng `ordered`
-- --
-- ALTER TABLE `ordered`
--   ADD CONSTRAINT `ordered_ibfk_4` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- --
-- -- Các ràng buộc cho bảng `product`
-- --
-- ALTER TABLE `product`
--   ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- --
-- -- Các ràng buộc cho bảng `review`
-- --
-- ALTER TABLE `review`
--   ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- COMMIT;

-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
