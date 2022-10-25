package com.vkontakte.android.ui.holder.gamepage;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.widget.TextView;
import com.facebook.share.internal.ShareConstants;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.TypefaceSpanAssets;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes3.dex */
public class GameInviteHolder extends RecyclerHolder<GameRequest> implements View.OnClickListener {
    @Nullable
    public TextView appName;
    @Nullable
    public TextView appSubtitle;
    public final RequestBgDrawable drawable;
    @Nullable
    public VKImageView icon;
    public TextView msg;
    public TextView name;
    public VKImageView photo;
    public TextView time;
    @NonNull
    protected final String visitSource;

    public GameInviteHolder(@NonNull Context context, @NonNull String visitSource) {
        this(context, visitSource, null);
    }

    public GameInviteHolder(@NonNull Context context, @NonNull String visitSource, RequestBgDrawable drawable) {
        this(context, visitSource, drawable, R.layout.apps_req_item_invite);
    }

    public GameInviteHolder(@NonNull Context context, @NonNull String visitSource, RequestBgDrawable drawable, int layoutRes) {
        super(layoutRes, context);
        this.drawable = drawable;
        this.visitSource = visitSource;
        if (drawable != null) {
            this.itemView.setBackgroundDrawable(drawable);
        }
        this.name = (TextView) $(R.id.friend_req_name);
        this.msg = (TextView) $(R.id.friend_req_info);
        this.appName = (TextView) $(R.id.app_title);
        this.appSubtitle = (TextView) $(R.id.app_subtitle);
        this.time = (TextView) $(R.id.friend_req_date);
        this.photo = (VKImageView) $(R.id.friend_req_photo);
        this.icon = (VKImageView) $(R.id.app_icon);
        this.photo.setOnClickListener(this);
        View buttonGoToGame = $(R.id.play_button);
        if (buttonGoToGame != null) {
            buttonGoToGame.setOnClickListener(this);
        }
        View buttonHide = $(R.id.hide_button);
        if (buttonHide != null) {
            buttonHide.setOnClickListener(this);
        }
        View view = $(R.id.app_ok);
        if (view != null) {
            view.setOnClickListener(this);
        }
        View view2 = $(R.id.app_cancel);
        if (view2 != null) {
            view2.setOnClickListener(this);
        }
    }

    private SpannableStringBuilder createTitle(List<UserProfile> userProfiles, int typeRequest) {
        int colorTextBlue = getResources().getColor(R.color.text_blue);
        int colorGameGray = getResources().getColor(R.color.game_gray);
        SpannableStringBuilder title = new SpannableStringBuilder();
        Set<Integer> ids = new HashSet<>();
        for (int i = 0; userProfiles != null && i < userProfiles.size(); i++) {
            UserProfile profile = userProfiles.get(i);
            if (!ids.contains(Integer.valueOf(profile.uid))) {
                ids.add(Integer.valueOf(profile.uid));
                if (i == userProfiles.size() - 1 && i != 0) {
                    title.append((CharSequence) createForegroundColorSpan(' ' + getString(R.string.ntf_two_users_c) + ' ', colorGameGray));
                } else if (i != 0) {
                    title.append((CharSequence) createForegroundColorSpan(", ", colorGameGray));
                }
                title.append((CharSequence) createTypefaceSpanColorSpan(profile.fullName, colorTextBlue));
            }
        }
        if (typeRequest == 1) {
            title.append((CharSequence) createForegroundColorSpan(' ' + getString(ids.size() > 1 ? R.string.games_invites : R.string.games_invite), colorGameGray));
        }
        return title;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GameRequest r) {
        if (this.appName != null) {
            this.appName.setText(r.appTitle);
        }
        if (this.appSubtitle != null) {
            this.appSubtitle.setText(r.appGenre);
        }
        UserProfile activeUser = (r.userProfiles == null || r.userProfiles.size() <= 0) ? null : r.userProfiles.get(0);
        if (activeUser != null) {
            this.photo.load(activeUser.photo);
        } else {
            this.photo.load(null);
        }
        if (this.icon != null) {
            this.icon.load(r.appUrl);
        }
        SpannableStringBuilder title = (SpannableStringBuilder) r.getTag();
        if (title == null) {
            title = createTitle(r.userProfiles, r.type);
            r.setTag(title);
        }
        this.name.setText(title);
        if (this.time != null) {
            this.time.setText(TimeUtils.shortDate(r.time, getContext()));
        }
        if (r.type == 1) {
            this.msg.setVisibility(8);
        } else if (r.text.length() > 0) {
            this.msg.setText(r.text);
        } else if (r.userProfiles != null && r.userProfiles.size() > 1) {
            this.msg.setText(getString(R.string.games_notify_requests));
        } else if (activeUser != null) {
            this.msg.setText(getString(activeUser.f ? R.string.games_notify_request_f : R.string.games_notify_request_m, r.appTitle));
        }
        this.photo.setTag(activeUser == null ? null : Integer.valueOf(activeUser.uid));
        if (this.drawable != null) {
            this.drawable.updateRequest(getItem());
            this.itemView.setBackgroundDrawable(this.drawable);
        }
    }

    private static Spannable createForegroundColorSpan(String str, int color) {
        Spannable sb = Spannable.Factory.getInstance().newSpannable(str);
        sb.setSpan(new ForegroundColorSpan(color), 0, sb.length(), 0);
        return sb;
    }

    private static Spannable createTypefaceSpanColorSpan(String str, int color) {
        Spannable sb = Spannable.Factory.getInstance().newSpannable(str);
        sb.setSpan(new ForegroundColorSpan(color), 0, sb.length(), 0);
        sb.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, sb.length(), 0);
        return sb;
    }

    protected void onPlayButtonClick() {
        Games.open(getItem().apiApplication, null, (Activity) getContext(), this.visitSource, ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        GameRequest currentRequest = getItem();
        switch (v.getId()) {
            case R.id.friend_req_photo /* 2131755475 */:
                Integer uid = (Integer) v.getTag();
                if (uid != null) {
                    new ProfileFragment.Builder(uid.intValue()).go(getContext());
                    return;
                }
                return;
            case R.id.friend_req_date /* 2131755476 */:
            case R.id.friend_req_name /* 2131755477 */:
            case R.id.friend_req_info /* 2131755478 */:
            default:
                return;
            case R.id.play_button /* 2131755479 */:
                onPlayButtonClick();
                break;
            case R.id.hide_button /* 2131755480 */:
                break;
            case R.id.app_ok /* 2131755481 */:
                if (currentRequest != null) {
                    if (currentRequest.apiApplication.isHtml5App && currentRequest.type == 2) {
                        GameRequestHolder.openGame(currentRequest, (Activity) getContext(), this.visitSource);
                        Games.deleteRequest(v.getContext(), currentRequest);
                        return;
                    }
                    GameCardActivity.openApp(getContext(), this.visitSource, ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID, currentRequest.apiApplication);
                    Games.deleteRequest(v.getContext(), currentRequest);
                    return;
                }
                return;
            case R.id.app_cancel /* 2131755482 */:
                Games.deleteRequest(v.getContext(), currentRequest);
                return;
        }
        Games.deleteRequestAll(v.getContext(), currentRequest);
    }
}
