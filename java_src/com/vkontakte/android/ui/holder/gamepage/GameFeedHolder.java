package com.vkontakte.android.ui.holder.gamepage;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.SpanHelper;
import com.vkontakte.android.utils.TypefaceSpanAssets;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameFeedHolder extends RecyclerHolder<GameFeedEntry> implements View.OnClickListener, UsableRecyclerView.Clickable {
    private String clickSource;
    private final VKImageView icon;
    private final ImageView instantGameBadge;
    private final boolean isNeedShowDate;
    private boolean openCardByClick;
    private final VKImageView photo;
    private final TextView text;
    private String visitSource;

    public GameFeedHolder(@NonNull ViewGroup parent) {
        this(parent, false);
    }

    public GameFeedHolder(@NonNull ViewGroup parent, boolean isNeedShowDate) {
        super((int) R.layout.apps_feed_item, parent);
        this.openCardByClick = false;
        this.isNeedShowDate = isNeedShowDate;
        this.text = (TextView) $(R.id.nc_user_name);
        this.instantGameBadge = (ImageView) $(R.id.app_img_instant);
        this.photo = (VKImageView) $(R.id.nc_user_photo);
        this.photo.setOnClickListener(this);
        this.icon = (VKImageView) $(R.id.nc_post_photo);
        if (isNeedShowDate) {
            this.icon.setVisibility(8);
        }
    }

    public GameFeedHolder setClickInfo(boolean openCardByClick, String visitSource, String clickSource) {
        this.openCardByClick = openCardByClick;
        this.visitSource = visitSource;
        this.clickSource = clickSource;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GameFeedEntry data) {
        this.photo.setTag(Integer.valueOf(data.user.uid));
        this.photo.load(data.user.photo);
        this.icon.load(data.app.icon.getImageByWidth(V.dp(48.0f)).url);
        this.instantGameBadge.setVisibility(data.app.isHtml5App ? 0 : 8);
        CharSequence formattedText = (CharSequence) data.getTag();
        if (formattedText == null) {
            formattedText = formatText(data);
            data.setTag(formattedText);
        }
        this.text.setText(formattedText);
    }

    CharSequence formatText(GameFeedEntry data) {
        String shortDate;
        int colorTextBlue = getResources().getColor(R.color.text_blue);
        int colorTextLightGray = getResources().getColor(R.color.text_game_light_gray);
        SpannableStringBuilder result = new SpannableStringBuilder();
        CharSequence userName = spanForUserName(data.user.firstName, colorTextBlue);
        switch (data.type) {
            case level:
                if (this.isNeedShowDate) {
                    result.append((CharSequence) SpanHelper.format(getString(data.user.f ? R.string.games_level_f_date : R.string.games_level_m_date), userName, spanForSecondArgs(data.level)));
                    break;
                } else {
                    result.append((CharSequence) SpanHelper.format(getString(data.user.f ? R.string.games_level_f : R.string.games_level_m), userName, spanForSecondArgs(data.level), spanForAppTitle(data.app.title, colorTextBlue)));
                    break;
                }
            case achievement:
                if (this.isNeedShowDate) {
                    result.append((CharSequence) SpanHelper.format(getString(R.string.games_achievement_date), userName, spanForSecondArgs(data.text)));
                    break;
                } else {
                    result.append((CharSequence) SpanHelper.format(getString(R.string.games_achievement), userName, data.text, spanForAppTitle(data.app.title, colorTextBlue)));
                    break;
                }
            case score:
                if (this.isNeedShowDate) {
                    result.append((CharSequence) SpanHelper.format(getString(data.user.f ? R.string.games_score_f_date : R.string.games_score_m_date), userName, spanForSecondArgs(data.value)));
                    break;
                } else {
                    result.append((CharSequence) SpanHelper.format(getString(data.user.f ? R.string.games_score_f : R.string.games_score_m), userName, spanForSecondArgs(data.value), spanForAppTitle(data.app.title, colorTextBlue)));
                    break;
                }
            default:
                result.append((CharSequence) SpanHelper.format(getString(data.user.f ? R.string.games_installed_f : R.string.games_installed_m), userName, spanForAppTitle(data.app.title, colorTextBlue)));
                break;
        }
        Spannable.Factory factory = Spannable.Factory.getInstance();
        if (this.isNeedShowDate) {
            shortDate = "\n" + TimeUtils.langDate(data.date);
        } else {
            shortDate = TimeUtils.shortDate(data.date, getContext());
        }
        Spannable time = factory.newSpannable(shortDate);
        time.setSpan(new ForegroundColorSpan(colorTextLightGray), 0, time.length(), 0);
        result.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append((CharSequence) time);
        return result;
    }

    private static CharSequence spanForSecondArgs(int arg) {
        return spanForSecondArgs(String.valueOf(arg));
    }

    private static CharSequence spanForSecondArgs(String arg) {
        Spannable spannable = Spannable.Factory.getInstance().newSpannable(arg);
        spannable.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, spannable.length(), 0);
        return spannable;
    }

    private static CharSequence spanForAppTitle(String appTitle, int color) {
        Spannable spannable = Spannable.Factory.getInstance().newSpannable(appTitle);
        spannable.setSpan(new ForegroundColorSpan(color), 0, spannable.length(), 0);
        return spannable;
    }

    private static CharSequence spanForUserName(String userName, int color) {
        Spannable spannable = Spannable.Factory.getInstance().newSpannable(userName);
        spannable.setSpan(new ForegroundColorSpan(color), 0, spannable.length(), 0);
        spannable.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, spannable.length(), 0);
        return spannable;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (!this.openCardByClick) {
            Games.open(getItem().app, null, (Activity) getContext(), this.visitSource, this.clickSource);
        } else {
            GameCardActivity.openApp(getContext(), this.visitSource, this.clickSource, getItem().app);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        new ProfileFragment.Builder(((Integer) v.getTag()).intValue()).go(getContext());
    }
}
