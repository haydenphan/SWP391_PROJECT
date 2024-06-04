/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Khoi
 */
public class Level {
    private int levelId;
    private String levelName;

    public Level(int levelId, String levelName) {
        this.levelId = levelId;
        this.levelName = levelName;
    }

    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    @Override
    public String toString() {
        return "Level{" +
                "levelId=" + levelId +
                ", levelName='" + levelName + '\'' +
                '}';
    }
}
