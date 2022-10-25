.class public interface abstract Lcom/vkontakte/android/statistics/Statistic;
.super Ljava/lang/Object;
.source "Statistic.java"

# interfaces
.implements Lcom/vkontakte/android/utils/Serializer$Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;
    }
.end annotation


# static fields
.field public static final TYPE_CLICK:Ljava/lang/String; = "click"

.field public static final TYPE_DEEP_LINK:Ljava/lang/String; = "click_deeplink"

.field public static final TYPE_IMPRESSION:Ljava/lang/String; = "impression"

.field public static final TYPE_IMPRESSION_PRETTY_CARD:Ljava/lang/String; = "ads/impression_pretty_card"

.field public static final TYPE_LOAD:Ljava/lang/String; = "load"

.field public static final TYPE_POST_LIKE:Ljava/lang/String; = "like_post"

.field public static final TYPE_POST_LINK:Ljava/lang/String; = "click_post_link"

.field public static final TYPE_POST_OWNER_CLICK:Ljava/lang/String; = "click_post_owner"

.field public static final TYPE_POST_SHARE:Ljava/lang/String; = "share_post"

.field public static final TYPE_VIDEO_100:Ljava/lang/String; = "video_play_100"

.field public static final TYPE_VIDEO_25:Ljava/lang/String; = "video_play_25"

.field public static final TYPE_VIDEO_3S:Ljava/lang/String; = "video_play_3s"

.field public static final TYPE_VIDEO_50:Ljava/lang/String; = "video_play_50"

.field public static final TYPE_VIDEO_75:Ljava/lang/String; = "video_play_75"

.field public static final TYPE_VIDEO_95:Ljava/lang/String; = "video_play_95"

.field public static final TYPE_VIDEO_FULLSCREEN_OFF:Ljava/lang/String; = "video_fullscreen_off"

.field public static final TYPE_VIDEO_FULLSCREEN_ON:Ljava/lang/String; = "video_fullscreen_on"

.field public static final TYPE_VIDEO_PAUSE:Ljava/lang/String; = "video_pause"

.field public static final TYPE_VIDEO_PLAY:Ljava/lang/String; = "video_start"

.field public static final TYPE_VIDEO_RESUME:Ljava/lang/String; = "video_resume"

.field public static final TYPE_VIDEO_VOLUME_OFF:Ljava/lang/String; = "video_volume_off"

.field public static final TYPE_VIDEO_VOLUME_ON:Ljava/lang/String; = "video_volume_on"


# virtual methods
.method public abstract addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V
.end method

.method public abstract getStatisticByType(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/statistics/StatisticUrl;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getStatisticHash()I
.end method

.method public abstract getStatisticSizeByType(Ljava/lang/String;)I
.end method
