package com.vkontakte.android.ui.binder;

import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.Size;
import android.view.View;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.CollectionUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.functions.Predicate;
import com.vkontakte.android.ui.PhotoStripView;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public final class LikeBarBinder {
    private LikeLabelFormatter formatter;
    public View likesContainer;
    public TextView likesCounterView;
    public TextView likesLabelView;
    public PhotoStripView likesPhotoView;
    public TextView repostsCounterView;
    public TextView viewsCounterView;

    public LikeBarBinder(@NonNull View view) {
        this.likesContainer = view.findViewById(R.id.wall_view_like_container);
        this.likesPhotoView = (PhotoStripView) view.findViewById(R.id.wall_view_like_photos);
        this.likesLabelView = (TextView) view.findViewById(R.id.wall_view_like_label);
        this.likesCounterView = (TextView) view.findViewById(R.id.wall_view_like);
        this.viewsCounterView = (TextView) view.findViewById(R.id.wall_view_views);
        this.repostsCounterView = (TextView) view.findViewById(R.id.wall_view_repost);
        this.likesPhotoView.setOverlapOffset(0.8f);
        this.likesPhotoView.setPadding(V.dp(2.0f));
    }

    public void bind(boolean liked, boolean reposted, int likeCount, int repostCount, int viewCount, @NonNull List<LikeInfo> likes) {
        F1 f1;
        int i = 1;
        if (likeCount > 0) {
            this.likesCounterView.setText(Global.formatNumber(likeCount));
        } else {
            this.likesCounterView.setText((CharSequence) null);
        }
        this.likesCounterView.setSelected(liked);
        if (repostCount > 0) {
            this.repostsCounterView.setText(Global.formatNumber(repostCount));
        } else {
            this.repostsCounterView.setText((CharSequence) null);
        }
        this.repostsCounterView.setSelected(reposted);
        if (viewCount > 0) {
            this.viewsCounterView.setVisibility(0);
            this.viewsCounterView.setText(Global.formatNumber(viewCount));
        } else {
            this.viewsCounterView.setVisibility(8);
        }
        if (likes.size() != this.likesPhotoView.size()) {
            this.likesPhotoView.setCount(likes.size());
        }
        if (likes.size() > 0) {
            this.likesContainer.setVisibility(0);
            PhotoStripView photoStripView = this.likesPhotoView;
            f1 = LikeBarBinder$$Lambda$1.instance;
            photoStripView.load(Functions.project((List) likes, f1));
            if (this.formatter == null) {
                this.formatter = new LikeLabelFormatter();
            }
            TextView textView = this.likesLabelView;
            LikeLabelFormatter likeLabelFormatter = this.formatter;
            int i2 = likeCount - (liked ? 1 : 0);
            if (!reposted) {
                i = 0;
            }
            textView.setText(likeLabelFormatter.format(i2, repostCount - i, likes));
            return;
        }
        this.likesContainer.setVisibility(8);
    }

    /* loaded from: classes3.dex */
    public static final class LikeLabelFormatter {
        static final F1<String, LikeInfo> formatUser;
        static final F1<String, LikeInfo> formatUserDat;
        static final F1<String, LikeInfo> formatUserFull;
        static final F1<String, LikeInfo> formatUserFullDat;
        static final Predicate<LikeInfo> isFriend;
        static final Predicate<LikeInfo> isMale;
        static final Predicate<LikeInfo> isNotUser;
        static final Predicate<LikeInfo> isUser;
        LikeFormatter likeFormatter;
        RepostFormatter repostFormatter;

        LikeLabelFormatter() {
        }

        static {
            Predicate<LikeInfo> predicate;
            Predicate<LikeInfo> predicate2;
            Predicate<LikeInfo> predicate3;
            Predicate<LikeInfo> predicate4;
            F1<String, LikeInfo> f1;
            F1<String, LikeInfo> f12;
            F1<String, LikeInfo> f13;
            F1<String, LikeInfo> f14;
            predicate = LikeBarBinder$LikeLabelFormatter$$Lambda$1.instance;
            isUser = predicate;
            predicate2 = LikeBarBinder$LikeLabelFormatter$$Lambda$2.instance;
            isNotUser = predicate2;
            predicate3 = LikeBarBinder$LikeLabelFormatter$$Lambda$3.instance;
            isMale = predicate3;
            predicate4 = LikeBarBinder$LikeLabelFormatter$$Lambda$4.instance;
            isFriend = predicate4;
            f1 = LikeBarBinder$LikeLabelFormatter$$Lambda$5.instance;
            formatUserDat = f1;
            f12 = LikeBarBinder$LikeLabelFormatter$$Lambda$6.instance;
            formatUserFullDat = f12;
            f13 = LikeBarBinder$LikeLabelFormatter$$Lambda$7.instance;
            formatUser = f13;
            f14 = LikeBarBinder$LikeLabelFormatter$$Lambda$8.instance;
            formatUserFull = f14;
        }

        public static /* synthetic */ boolean lambda$static$0(LikeInfo i) {
            return i.type == 1;
        }

        public static /* synthetic */ boolean lambda$static$1(LikeInfo i) {
            return i.type != 1;
        }

        public static /* synthetic */ String lambda$static$5(LikeInfo i) {
            return i.getString(LikeInfo.DATA_FIRST_NAME_DAT) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + i.getString(LikeInfo.DATA_LAST_NAME_DAT);
        }

        public static /* synthetic */ String lambda$static$7(LikeInfo i) {
            return i.getString(LikeInfo.DATA_FIRST_NAME) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + i.getString(LikeInfo.DATA_LAST_NAME);
        }

        @Nullable
        String format(int likeCount, int repostCount, @Size(min = 1) @NonNull List<LikeInfo> likes) {
            if (likeCount != 0) {
                if (this.likeFormatter == null) {
                    this.likeFormatter = new LikeFormatter();
                }
                return this.likeFormatter.format(likeCount, likes);
            } else if (repostCount != 0) {
                if (this.repostFormatter == null) {
                    this.repostFormatter = new RepostFormatter();
                }
                return this.repostFormatter.format(repostCount, likes);
            } else {
                return null;
            }
        }

        /* loaded from: classes3.dex */
        public static final class LikeFormatter {
            LikeFormatter() {
            }

            @NonNull
            String format(@IntRange(from = 1) int count, @Size(min = 1) @NonNull List<LikeInfo> likes) {
                int friendsCount = CollectionUtils.count(likes, LikeLabelFormatter.isFriend);
                int fixedCount = count - friendsCount;
                if (friendsCount == 1) {
                    return count == friendsCount ? VKApplication.context.getString(R.string.post_liked_one, LikeLabelFormatter.formatUserFullDat.f(likes.get(0))) : VKApplication.context.getString(R.string.post_liked_one_more, LikeLabelFormatter.formatUserFullDat.f(likes.get(0)), VKApplication.context.getResources().getQuantityString(R.plurals.post_people_dat, fixedCount, Integer.valueOf(fixedCount)));
                } else if (friendsCount != 2) {
                    return VKApplication.context.getString(R.string.post_liked_many, VKApplication.context.getResources().getQuantityString(R.plurals.post_people_dat, fixedCount, Integer.valueOf(fixedCount)));
                } else {
                    return count == friendsCount ? VKApplication.context.getString(R.string.post_liked_two, LikeLabelFormatter.formatUserDat.f(likes.get(0)), LikeLabelFormatter.formatUserDat.f(likes.get(1))) : VKApplication.context.getString(R.string.post_liked_two_more, LikeLabelFormatter.formatUserDat.f(likes.get(0)), LikeLabelFormatter.formatUserDat.f(likes.get(1)), VKApplication.context.getResources().getQuantityString(R.plurals.post_people_dat, fixedCount, Integer.valueOf(fixedCount)));
                }
            }
        }

        /* loaded from: classes3.dex */
        public static final class RepostFormatter {
            RepostFormatter() {
            }

            @NonNull
            String format(@IntRange(from = 1) int count, @Size(min = 1) @NonNull List<LikeInfo> likes) {
                int friendsCount = CollectionUtils.count(likes, LikeLabelFormatter.isFriend);
                int fixedCount = count - friendsCount;
                if (friendsCount != 1) {
                    return friendsCount == 2 ? count == friendsCount ? VKApplication.context.getString(R.string.post_reposted_two, LikeLabelFormatter.formatUser.f(likes.get(0)), LikeLabelFormatter.formatUser.f(likes.get(1))) : VKApplication.context.getString(R.string.post_reposted_two_more, LikeLabelFormatter.formatUser.f(likes.get(0)), LikeLabelFormatter.formatUser.f(likes.get(1)), String.valueOf(fixedCount)) : count == CollectionUtils.count(likes, LikeLabelFormatter.isNotUser) ? VKApplication.context.getResources().getQuantityString(R.plurals.post_reposted_community, fixedCount, Integer.valueOf(fixedCount)) : VKApplication.context.getResources().getQuantityString(R.plurals.post_reposted_people, fixedCount, Integer.valueOf(fixedCount));
                } else if (count == friendsCount) {
                    LikeInfo like = likes.get(0);
                    return LikeLabelFormatter.isMale.f(like) ? VKApplication.context.getString(R.string.post_reposted_one_male, LikeLabelFormatter.formatUserFull.f(like)) : VKApplication.context.getString(R.string.post_reposted_one_female, LikeLabelFormatter.formatUserFull.f(like));
                } else {
                    LikeInfo like2 = (LikeInfo) CollectionUtils.findFirst(likes, Functions.combineAnd(LikeLabelFormatter.isUser, LikeLabelFormatter.isFriend));
                    return LikeLabelFormatter.isMale.f(like2) ? VKApplication.context.getString(R.string.post_reposted_one_more, LikeLabelFormatter.formatUserFull.f(like2), String.valueOf(fixedCount)) : VKApplication.context.getString(R.string.post_reposted_one_more, LikeLabelFormatter.formatUserFull.f(like2), String.valueOf(fixedCount));
                }
            }
        }
    }
}
