package com.vkontakte.android.api.widget;

import android.support.annotation.Nullable;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Match extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Match> CREATOR = new Serializer.CreatorAdapter<Match>() { // from class: com.vkontakte.android.api.widget.Match.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Match mo1087createFromSerializer(Serializer s) {
            return new Match(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Match[] mo1088newArray(int size) {
            return new Match[size];
        }
    };
    private final Image icon;
    private final String liveUrl;
    private final Score score;
    private final String state;
    private final Team teamA;
    private final Team teamB;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Match(JSONObject match) throws JSONException {
        String str = null;
        this.state = match.optString("state");
        this.score = new Score(match.optJSONObject(FirebaseAnalytics.Param.SCORE));
        this.teamA = new Team(match.getJSONObject("team_a"));
        this.teamB = new Team(match.getJSONObject("team_b"));
        JSONArray icons = match.optJSONArray(SettingsJsonConstants.APP_ICON_KEY);
        JSONObject liveAction = match.optJSONObject("live_action");
        this.icon = icons == null ? null : new Image(icons);
        this.liveUrl = liveAction != null ? liveAction.getString("url") : str;
    }

    Match(Serializer s) {
        this.teamA = (Team) s.readSerializable(Team.class.getClassLoader());
        this.teamB = (Team) s.readSerializable(Team.class.getClassLoader());
        this.icon = (Image) s.readSerializable(Image.class.getClassLoader());
        this.score = (Score) s.readSerializable(Score.class.getClassLoader());
        this.state = s.readString();
        this.liveUrl = s.readString();
    }

    public Team getTeamA() {
        return this.teamA;
    }

    public Team getTeamB() {
        return this.teamB;
    }

    public Score getScore() {
        return this.score;
    }

    public String getState() {
        return this.state;
    }

    public boolean hasIcon() {
        return this.icon != null && !this.icon.isEmpty();
    }

    @Nullable
    public ImageSize getIcon(int width) {
        if (this.icon == null) {
            return null;
        }
        return this.icon.getImageByWidth(width);
    }

    @Nullable
    public String getLiveUrl() {
        return this.liveUrl;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.teamA);
        s.writeSerializable(this.teamB);
        s.writeSerializable(this.icon);
        s.writeSerializable(this.score);
        s.writeString(this.state);
        s.writeString(this.liveUrl);
    }

    /* loaded from: classes2.dex */
    public static class Score extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Score> CREATOR = new Serializer.CreatorAdapter<Score>() { // from class: com.vkontakte.android.api.widget.Match.Score.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Score mo1087createFromSerializer(Serializer s) {
                return new Score(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Score[] mo1088newArray(int size) {
                return new Score[size];
            }
        };
        private final Integer scoreA;
        private final Integer scoreB;

        Score(JSONObject score) throws JSONException {
            if (score == null) {
                this.scoreA = null;
                this.scoreB = null;
                return;
            }
            this.scoreA = Integer.valueOf(score.getInt("team_a"));
            this.scoreB = Integer.valueOf(score.getInt("team_b"));
        }

        Score(Serializer s) {
            Integer num = null;
            String valueA = s.readString();
            String valueB = s.readString();
            this.scoreA = valueA == null ? null : Integer.valueOf(valueA);
            this.scoreB = valueB != null ? Integer.valueOf(valueB) : num;
        }

        public int getScoreA() {
            return this.scoreA.intValue();
        }

        public int getScoreB() {
            return this.scoreB.intValue();
        }

        public boolean hasScore() {
            return (this.scoreA == null || this.scoreB == null) ? false : true;
        }

        public String toString() {
            return hasScore() ? this.scoreA + ":" + this.scoreB : "–";
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            String str = null;
            s.writeString(this.scoreA == null ? null : this.scoreA.toString());
            if (this.scoreB != null) {
                str = this.scoreB.toString();
            }
            s.writeString(str);
        }
    }
}
