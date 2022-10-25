.class public Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;
.super Landroid/widget/FrameLayout;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InsetsFrameLayout"
.end annotation


# instance fields
.field insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1210
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1211
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;->setWillNotDraw(Z)V

    .line 1213
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1216
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1217
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 1220
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 1221
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1226
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 1227
    return-void
.end method


# virtual methods
.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 1
    .param p1, "insets"    # Landroid/graphics/Rect;

    .prologue
    .line 1238
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    if-eqz v0, :cond_0

    .line 1239
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->setInsets(Landroid/graphics/Rect;)V

    .line 1241
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->fitSystemWindows(Landroid/graphics/Rect;)Z

    move-result v0

    return v0
.end method

.method protected onFinishInflate()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    .line 1232
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 1233
    const v0, 0x7f10044d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$InsetsFrameLayout;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    .line 1234
    return-void
.end method
