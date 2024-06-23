package model;

public class Language {
    private int languageId;
    private String languageName;

    public Language(int languageId, String languageName) {
        this.languageId = languageId;
        this.languageName = languageName;
    }

    public int getLanguageId() {
        return languageId;
    }

    public String getLanguageName() {
        return languageName;
    }
}