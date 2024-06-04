/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khoi
 */
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