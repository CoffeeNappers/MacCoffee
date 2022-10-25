package com.vkontakte.android;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vkontakte.android.api.PollOption;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.polls.PollsAddVote;
import com.vkontakte.android.api.polls.PollsDeleteVote;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.fragments.userlist.PollVotersListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class PollAttachView extends LinearLayout {
    private TextView infoView;
    public boolean isBoard;
    public boolean isPublic;
    private OnDataLoadedListener listener;
    private int oid;
    private ArrayList<View> optionViews;
    private PollOption[] options;
    private int pid;
    private String question;
    private int userOption;

    /* loaded from: classes2.dex */
    public interface OnDataLoadedListener {
        void onDataLoaded(String str, int i, PollOption[] pollOptionArr, boolean z);
    }

    public PollAttachView(Context context, int _oid, int _pid) {
        super(context);
        this.optionViews = new ArrayList<>();
        this.oid = _oid;
        this.pid = _pid;
        setOrientation(1);
        ProgressBar pb = new ProgressBar(getContext());
        LinearLayout.LayoutParams pl = new LinearLayout.LayoutParams(Global.scale(30.0f), Global.scale(30.0f));
        pl.gravity = 17;
        pb.setLayoutParams(pl);
        addView(pb);
        setPadding(Global.scale(5.0f), 0, Global.scale(10.0f), Global.scale(10.0f));
    }

    public PollAttachView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.optionViews = new ArrayList<>();
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        super.onMeasure(wms, hms);
        setMeasuredDimension(View.MeasureSpec.getSize(wms), getMeasuredHeight());
    }

    private void onFailed(String emsg) {
        removeAllViews();
        TextView tv = new TextView(getContext());
        tv.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        tv.setPadding(Global.scale(5.0f), Global.scale(5.0f), Global.scale(5.0f), Global.scale(5.0f));
        tv.setGravity(17);
        tv.setText(getResources().getString(R.string.error_loading_poll, emsg));
        setBackgroundColor(-8739);
        addView(tv);
    }

    public void onLoaded(String question, int uanswer, PollOption[] opts, boolean pub) {
        if (this.listener != null) {
            this.listener.onDataLoaded(question, uanswer, opts, pub);
        }
        this.options = opts;
        this.question = question;
        this.userOption = uanswer;
        removeAllViews();
        TextView pqtView = new TextView(getContext());
        pqtView.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        pqtView.setText(question);
        pqtView.setTextSize(17.0f);
        addView(pqtView);
        int total = 0;
        for (PollOption o : opts) {
            total += o.numVotes;
        }
        this.infoView = new TextView(getContext());
        this.infoView.setTextColor(getResources().getColorStateList(R.color.hint));
        this.infoView.setText(getResources().getString(pub ? R.string.poll_open : R.string.poll_anonym) + ", " + getResources().getQuantityString(R.plurals.num_poll_votes, total, Integer.valueOf(total)));
        this.infoView.setTextSize(15.0f);
        addView(this.infoView);
        int maxvotes = 0;
        int maxpercent = 0;
        for (PollOption opt : opts) {
            maxpercent = Math.max(maxpercent, (int) (opt.percent * 10.0f));
            maxvotes = maxpercent;
        }
        (maxvotes + "").length();
        int length = opts.length;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < length) {
                PollOption opt2 = opts[i2];
                RelativeLayout pItem = new RelativeLayout(getContext());
                pItem.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
                TextView itemTitle = new TextView(getContext());
                itemTitle.setTextColor(ViewCompat.MEASURED_STATE_MASK);
                itemTitle.setText(opt2.title);
                itemTitle.setId(R.id.poll_opt_title);
                itemTitle.setPadding(0, Global.scale(5.0f), 0, 0);
                itemTitle.setTypeface(uanswer == opt2.id ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
                pItem.addView(itemTitle);
                ProgressBar pbar = new ProgressBar(getContext(), null, 16842872);
                pbar.setProgressDrawable(getResources().getDrawable(R.drawable.poll_progress));
                pbar.setMax(maxpercent);
                pbar.setProgress(uanswer != 0 ? (int) (opt2.percent * 10.0f) : 0);
                pbar.setId(R.id.poll_opt_progress);
                RelativeLayout.LayoutParams pparams = new RelativeLayout.LayoutParams(-1, Global.scale(20.0f));
                pparams.addRule(3, R.id.poll_opt_title);
                pparams.rightMargin = Global.scale(50.0f);
                pparams.topMargin = Global.scale(5.0f);
                pbar.setLayoutParams(pparams);
                pItem.addView(pbar);
                TextView prView = new TextView(getContext());
                prView.setTextColor(ViewCompat.MEASURED_STATE_MASK);
                prView.setTextSize(15.0f);
                prView.setId(R.id.poll_opt_percent);
                prView.setText(String.format("%.1f%%", Float.valueOf(opt2.percent)));
                prView.setVisibility(uanswer != 0 ? 0 : 4);
                RelativeLayout.LayoutParams tparams = new RelativeLayout.LayoutParams(-2, -2);
                tparams.addRule(6, R.id.poll_opt_progress);
                tparams.addRule(8, R.id.poll_opt_progress);
                tparams.addRule(11);
                prView.setLayoutParams(tparams);
                pItem.addView(prView);
                TextView overlayView = new TextView(getContext());
                overlayView.setTextColor(getResources().getColorStateList(R.color.hint));
                overlayView.setTextSize(15.0f);
                overlayView.setId(R.id.poll_opt_overlay);
                overlayView.setGravity(17);
                if (uanswer == 0) {
                    overlayView.setText(R.string.poll_btn_vote);
                } else {
                    overlayView.setText(opt2.numVotes + "");
                }
                RelativeLayout.LayoutParams olp = new RelativeLayout.LayoutParams(-2, -2);
                olp.addRule(6, R.id.poll_opt_progress);
                olp.addRule(8, R.id.poll_opt_progress);
                olp.addRule(5, R.id.poll_opt_progress);
                olp.addRule(7, R.id.poll_opt_progress);
                overlayView.setLayoutParams(olp);
                pItem.addView(overlayView);
                pItem.setTag(opt2);
                pItem.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.PollAttachView.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        PollOption o2 = (PollOption) v.getTag();
                        if (PollAttachView.this.userOption == 0) {
                            PollAttachView.this.vote(o2);
                        } else if (PollAttachView.this.isPublic) {
                            Bundle args = new Bundle();
                            args.putString("title", o2.title);
                            args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, PollAttachView.this.oid);
                            args.putInt("poll_id", PollAttachView.this.pid);
                            args.putInt("answer_id", o2.id);
                            Navigate.to(PollVotersListFragment.class, args, Utils.castToActivity(PollAttachView.this.getContext()));
                        }
                    }
                });
                pItem.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.vkontakte.android.PollAttachView.2
                    @Override // android.view.View.OnLongClickListener
                    public boolean onLongClick(View v) {
                        if (PollAttachView.this.userOption != 0) {
                            PollAttachView.this.unvote();
                            return true;
                        }
                        return false;
                    }
                });
                this.optionViews.add(pItem);
                addView(pItem);
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateText() {
        int total = 0;
        for (int i = 0; i < this.options.length; i++) {
            PollOption opt = this.options[i];
            total += opt.numVotes;
            View ov = this.optionViews.get(i);
            if (this.userOption != 0) {
                ov.findViewById(R.id.poll_opt_percent).setVisibility(0);
                ((TextView) ov.findViewById(R.id.poll_opt_percent)).setText(String.format("%.1f%%", Float.valueOf(opt.percent)));
                ((TextView) ov.findViewById(R.id.poll_opt_overlay)).setText(opt.numVotes + "");
            } else {
                ov.findViewById(R.id.poll_opt_percent).setVisibility(4);
                ((TextView) ov.findViewById(R.id.poll_opt_percent)).setText(String.format("%.1f%%", Float.valueOf(opt.percent)));
                ((TextView) ov.findViewById(R.id.poll_opt_overlay)).setText(R.string.poll_btn_vote);
            }
            ((TextView) ov.findViewById(R.id.poll_opt_title)).setTypeface(this.userOption == opt.id ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
        }
        this.infoView.setText(getResources().getString(this.isPublic ? R.string.poll_open : R.string.poll_anonym) + ", " + getResources().getQuantityString(R.plurals.num_poll_votes, total, Integer.valueOf(total)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateProgress() {
        PollOption[] pollOptionArr;
        float maxp = 0.0f;
        for (PollOption opt : this.options) {
            maxp = Math.max(maxp, opt.percent);
        }
        if (Build.VERSION.SDK_INT >= 11) {
            ArrayList<Animator> anims = new ArrayList<>();
            for (int i = 0; i < this.options.length; i++) {
                PollOption opt2 = this.options[i];
                View ov = this.optionViews.get(i);
                ((ProgressBar) ov.findViewById(R.id.poll_opt_progress)).setMax((int) (maxp * 10.0f));
                if (this.userOption != 0) {
                    anims.add(ObjectAnimator.ofInt(ov.findViewById(R.id.poll_opt_progress), "progress", (int) (opt2.percent * 10.0f)));
                } else {
                    anims.add(ObjectAnimator.ofInt(ov.findViewById(R.id.poll_opt_progress), "progress", 0));
                }
            }
            AnimatorSet set = new AnimatorSet();
            set.playTogether(anims);
            set.setDuration(400L);
            set.start();
            return;
        }
        for (int i2 = 0; i2 < this.options.length; i2++) {
            PollOption opt3 = this.options[i2];
            View ov2 = this.optionViews.get(i2);
            ((ProgressBar) ov2.findViewById(R.id.poll_opt_progress)).setMax((int) (maxp * 10.0f));
            if (this.userOption != 0) {
                ((ProgressBar) ov2.findViewById(R.id.poll_opt_progress)).setProgress((int) (opt3.percent * 10.0f));
            } else {
                ((ProgressBar) ov2.findViewById(R.id.poll_opt_progress)).setProgress(0);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void vote(final PollOption opt) {
        new PollsAddVote(this.oid, this.pid, opt.id, this.isBoard).setCallback(new ResultlessCallback(getContext()) { // from class: com.vkontakte.android.PollAttachView.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PollOption[] pollOptionArr;
                int totalVotes = 1;
                PollAttachView.this.userOption = opt.id;
                for (PollOption opt2 : PollAttachView.this.options) {
                    totalVotes += opt2.numVotes;
                }
                for (int i = 0; i < PollAttachView.this.options.length; i++) {
                    if (PollAttachView.this.options[i].id == opt.id) {
                        PollAttachView.this.options[i].numVotes++;
                    }
                    PollAttachView.this.options[i].percent = (PollAttachView.this.options[i].numVotes / totalVotes) * 100.0f;
                }
                PollAttachView.this.updateText();
                PollAttachView.this.animateProgress();
            }
        }).wrapProgress(getContext()).exec((View) this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unvote() {
        new PollsDeleteVote(this.oid, this.pid, this.userOption, this.isBoard).setCallback(new ResultlessCallback(getContext()) { // from class: com.vkontakte.android.PollAttachView.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PollOption[] pollOptionArr;
                int totalVotes = 0;
                for (PollOption opt : PollAttachView.this.options) {
                    totalVotes += opt.numVotes;
                }
                for (int i = 0; i < PollAttachView.this.options.length; i++) {
                    if (PollAttachView.this.options[i].id == PollAttachView.this.userOption) {
                        PollOption pollOption = PollAttachView.this.options[i];
                        pollOption.numVotes--;
                    }
                    PollAttachView.this.options[i].percent = (PollAttachView.this.options[i].numVotes / totalVotes) * 100.0f;
                }
                PollAttachView.this.userOption = 0;
                PollAttachView.this.updateText();
                PollAttachView.this.animateProgress();
            }
        }).wrapProgress(getContext()).exec((View) this);
    }

    public void setOnDataLoadedListener(OnDataLoadedListener l) {
        this.listener = l;
    }
}
