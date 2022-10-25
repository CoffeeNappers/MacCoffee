package com.vkontakte.android.attachments;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.crashlytics.android.answers.BuildConfig;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.polls.PollsAddVote;
import com.vkontakte.android.api.polls.PollsDeleteVote;
import com.vkontakte.android.api.polls.PollsGetById;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.userlist.PollVotersListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.PollOptionBackgroundDrawable;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PollAttachment extends Attachment {
    public static final Serializer.Creator<PollAttachment> CREATOR = new Serializer.CreatorAdapter<PollAttachment>() { // from class: com.vkontakte.android.attachments.PollAttachment.8
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PollAttachment mo1087createFromSerializer(Serializer s) {
            return new PollAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PollAttachment[] mo1088newArray(int size) {
            return new PollAttachment[size];
        }
    };
    public ArrayList<Answer> answers;
    public boolean isAnonymous;
    public boolean isBoard;
    public int lastUpdated;
    public int numVotes;
    public int oid;
    public transient NewsEntry parentPost;
    public int pid;
    public String question;
    public int userAnswer;

    public PollAttachment(JSONObject att) throws JSONException {
        boolean z = true;
        this.answers = new ArrayList<>();
        JSONArray ja = att.getJSONArray(BuildConfig.ARTIFACT_ID);
        for (int i = 0; i < ja.length(); i++) {
            JSONObject j = ja.getJSONObject(i);
            Answer a = new Answer();
            a.id = j.getInt("id");
            a.text = j.getString("text");
            a.votes = j.getInt("votes");
            a.rate = (float) j.getDouble("rate");
            this.answers.add(a);
        }
        this.question = att.getString("question");
        this.oid = att.getInt("owner_id");
        this.pid = att.getInt("id");
        this.numVotes = att.getInt("votes");
        this.userAnswer = att.optInt("answer_id");
        this.isAnonymous = att.getInt("anonymous") != 1 ? false : z;
        this.lastUpdated = (int) (System.currentTimeMillis() / 1000);
    }

    public PollAttachment(String question, int oid, int pid, ArrayList<Answer> answers, int numVotes, int userAnswer, boolean isAnonymous, int lastUpdated, boolean isBoard) {
        this.answers = new ArrayList<>();
        this.question = question;
        this.oid = oid;
        this.pid = pid;
        this.answers = answers;
        this.numVotes = numVotes;
        this.userAnswer = userAnswer;
        this.isAnonymous = isAnonymous;
        this.lastUpdated = lastUpdated;
        this.isBoard = isBoard;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        View v = View.inflate(context, R.layout.attach_poll, null);
        bindView(v);
        reloadIfNeeded(v);
        return v;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bindView(View v) {
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.question);
        updateAttachViewText(v);
        ViewGroup wrap = (ViewGroup) v.findViewById(R.id.answers_wrap);
        ArrayList<View> toRemove = new ArrayList<>();
        for (int i = 0; i < wrap.getChildCount(); i++) {
            if (wrap.getChildAt(i).getTag() instanceof Answer) {
                toRemove.add(wrap.getChildAt(i));
            }
        }
        Iterator<View> it = toRemove.iterator();
        while (it.hasNext()) {
            View vv = it.next();
            wrap.removeView(vv);
        }
        Iterator<Answer> it2 = this.answers.iterator();
        while (it2.hasNext()) {
            Answer a = it2.next();
            View av = ((LayoutInflater) v.getContext().getSystemService("layout_inflater")).inflate(R.layout.poll_option, wrap, false);
            ((TextView) av.findViewById(R.id.poll_option_text)).setText(a.text);
            PollOptionBackgroundDrawable bg = new PollOptionBackgroundDrawable();
            av.setBackgroundDrawable(bg);
            av.setTag(a);
            updateAttachViewProgress(av, false);
            av.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.attachments.PollAttachment.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v2) {
                    Answer a2 = (Answer) v2.getTag();
                    if (PollAttachment.this.userAnswer == 0) {
                        PollAttachment.this.vote(a2, (ViewGroup) v2.getParent());
                    } else if (!PollAttachment.this.isAnonymous) {
                        Bundle args = new Bundle();
                        args.putString("title", a2.text);
                        args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, PollAttachment.this.oid);
                        args.putInt("poll_id", PollAttachment.this.pid);
                        args.putInt("answer_id", a2.id);
                        Navigate.to(PollVotersListFragment.class, args, v2.getContext());
                    }
                }
            });
            av.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.vkontakte.android.attachments.PollAttachment.2
                @Override // android.view.View.OnLongClickListener
                public boolean onLongClick(View v2) {
                    if (PollAttachment.this.userAnswer != 0) {
                        PollAttachment.this.unvote((ViewGroup) v2.getParent());
                        return true;
                    }
                    return false;
                }
            });
            wrap.addView(av);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void vote(final Answer a, final ViewGroup wrap) {
        wrap.findViewWithTag(a).findViewById(R.id.poll_option_progress).setVisibility(0);
        new PollsAddVote(this.oid, this.pid, a.id, this.isBoard).setCallback(new ResultlessCallback(wrap.getContext()) { // from class: com.vkontakte.android.attachments.PollAttachment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PollAttachment.this.numVotes = 1;
                PollAttachment.this.userAnswer = a.id;
                Iterator<Answer> it = PollAttachment.this.answers.iterator();
                while (it.hasNext()) {
                    Answer opt = it.next();
                    PollAttachment.this.numVotes += opt.votes;
                }
                for (int i = 0; i < PollAttachment.this.answers.size(); i++) {
                    if (PollAttachment.this.answers.get(i).id == a.id) {
                        PollAttachment.this.answers.get(i).votes++;
                    }
                    PollAttachment.this.answers.get(i).rate = (PollAttachment.this.answers.get(i).votes / PollAttachment.this.numVotes) * 100.0f;
                }
                wrap.findViewWithTag(a).findViewById(R.id.poll_option_progress).setVisibility(8);
                PollAttachment.this.updateAttachViewText(wrap);
                for (int i2 = 0; i2 < wrap.getChildCount(); i2++) {
                    View c = wrap.getChildAt(i2);
                    if (c.getTag() instanceof Answer) {
                        PollAttachment.this.updateAttachViewProgress(c, true);
                    }
                }
                PollAttachment.this.updateCachedPost();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                View view = wrap.findViewWithTag(a);
                if (view != null) {
                    ViewUtils.setVisibility(view.findViewById(R.id.poll_option_progress), 8);
                }
            }
        }).exec((View) wrap);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unvote(final ViewGroup wrap) {
        new PollsDeleteVote(this.oid, this.pid, this.userAnswer, this.isBoard).setCallback(new ResultlessCallback(wrap.getContext()) { // from class: com.vkontakte.android.attachments.PollAttachment.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PollAttachment.this.numVotes = -1;
                Iterator<Answer> it = PollAttachment.this.answers.iterator();
                while (it.hasNext()) {
                    Answer opt = it.next();
                    PollAttachment.this.numVotes += opt.votes;
                }
                for (int i = 0; i < PollAttachment.this.answers.size(); i++) {
                    if (PollAttachment.this.answers.get(i).id == PollAttachment.this.userAnswer) {
                        Answer answer = PollAttachment.this.answers.get(i);
                        answer.votes--;
                    }
                    PollAttachment.this.answers.get(i).rate = (PollAttachment.this.answers.get(i).votes / PollAttachment.this.numVotes) * 100.0f;
                }
                PollAttachment.this.userAnswer = 0;
                PollAttachment.this.updateAttachViewText(wrap);
                for (int i2 = 0; i2 < wrap.getChildCount(); i2++) {
                    View c = wrap.getChildAt(i2);
                    if (c.getTag() instanceof Answer) {
                        PollAttachment.this.updateAttachViewProgress(c, true);
                    }
                }
                PollAttachment.this.updateCachedPost();
            }
        }).wrapProgress(wrap.getContext()).exec((View) wrap);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateCachedPost() {
        NewsfeedCache.replaceOne(this.parentPost);
        if (this.parentPost != null) {
            VKApplication.context.sendBroadcast(new Intent(Posts.ACTION_POST_REPLACED_BROADCAST).putExtra("entry", this.parentPost).putExtra("bg_only", true), "com.vkontakte.android.permission.ACCESS_DATA");
        }
    }

    private void reloadIfNeeded(final View view) {
        if (((int) (System.currentTimeMillis() / 1000)) - this.lastUpdated >= 300) {
            new PollsGetById(this.oid, this.pid).setCallback(new Callback<PollAttachment>() { // from class: com.vkontakte.android.attachments.PollAttachment.5
                @Override // com.vkontakte.android.api.Callback
                public void success(PollAttachment result) {
                    PollAttachment.this.question = result.question;
                    PollAttachment.this.answers.clear();
                    PollAttachment.this.answers.addAll(result.answers);
                    PollAttachment.this.numVotes = result.numVotes;
                    PollAttachment.this.userAnswer = result.userAnswer;
                    PollAttachment.this.isAnonymous = result.isAnonymous;
                    PollAttachment.this.lastUpdated = (int) (System.currentTimeMillis() / 1000);
                    PollAttachment.this.bindView(view);
                    PollAttachment.this.updateCachedPost();
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec(view);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateAttachViewText(View v) {
        Context context = v.getContext();
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(context.getString(this.isAnonymous ? R.string.poll_anonym : R.string.poll_open) + " • " + context.getResources().getQuantityString(R.plurals.num_poll_votes, this.numVotes, Integer.valueOf(this.numVotes)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateAttachViewProgress(final View av, boolean animate) {
        Answer a = (Answer) av.getTag();
        TextView percent = (TextView) av.findViewById(R.id.poll_option_percent);
        percent.setText(String.format("%.0f %%", Float.valueOf(a.rate)));
        if (a.id == this.userAnswer) {
            percent.setTextColor(-11435592);
            percent.setTypeface(Font.Medium.typeface);
        } else {
            percent.setTextColor(ViewCompat.MEASURED_STATE_MASK);
            percent.setTypeface(Typeface.DEFAULT);
        }
        if (this.userAnswer != 0) {
            if (animate) {
                ObjectAnimator oa = ObjectAnimator.ofInt(av.getBackground(), "level", Math.round(a.rate * 100.0f)).setDuration(200L);
                oa.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.attachments.PollAttachment.6
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimator animation) {
                        av.invalidate();
                    }
                });
                oa.start();
                V.setVisibilityAnimated(percent, 0);
                return;
            }
            av.getBackground().setLevel(Math.round(a.rate * 100.0f));
            percent.setVisibility(0);
        } else if (animate) {
            ObjectAnimator oa2 = ObjectAnimator.ofInt(av.getBackground(), "level", 0).setDuration(200L);
            oa2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.attachments.PollAttachment.7
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator animation) {
                    av.invalidate();
                }
            });
            oa2.start();
            V.setVisibilityAnimated(percent, 4);
        } else {
            av.getBackground().setLevel(0);
            percent.setVisibility(4);
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return getFullView(context);
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        byte b = 1;
        s.writeString(this.question);
        s.writeInt(this.oid);
        s.writeInt(this.pid);
        s.writeInt(this.answers.size());
        for (int i = 0; i < this.answers.size(); i++) {
            s.writeSerializable(this.answers.get(i));
        }
        s.writeInt(this.numVotes);
        s.writeInt(this.userAnswer);
        s.writeByte(this.isAnonymous ? (byte) 1 : (byte) 0);
        s.writeInt(this.lastUpdated);
        if (!this.isBoard) {
            b = 0;
        }
        s.writeByte(b);
    }

    public String toString() {
        return "poll" + this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.pid;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    /* loaded from: classes2.dex */
    public static class Answer extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Answer> CREATOR = new Serializer.CreatorAdapter<Answer>() { // from class: com.vkontakte.android.attachments.PollAttachment.Answer.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Answer mo1087createFromSerializer(Serializer s) {
                return new Answer(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Answer[] mo1088newArray(int size) {
                return new Answer[size];
            }
        };
        public int id;
        public float rate;
        public String text;
        public int votes;

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeInt(this.id);
            s.writeString(this.text);
            s.writeInt(this.votes);
            s.writeFloat(this.rate);
        }

        public Answer() {
        }

        protected Answer(Serializer in) {
            this.id = in.readInt();
            this.text = in.readString();
            this.votes = in.readInt();
            this.rate = in.readFloat();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected PollAttachment(Serializer in) {
        boolean z = true;
        this.answers = new ArrayList<>();
        this.question = in.readString();
        this.oid = in.readInt();
        this.pid = in.readInt();
        int size = in.readInt();
        for (int i = 0; i < size; i++) {
            this.answers.add(in.readSerializable(Answer.class.getClassLoader()));
        }
        this.numVotes = in.readInt();
        this.userAnswer = in.readInt();
        this.isAnonymous = in.readByte() != 0;
        this.lastUpdated = in.readInt();
        this.isBoard = in.readByte() == 0 ? false : z;
    }
}
