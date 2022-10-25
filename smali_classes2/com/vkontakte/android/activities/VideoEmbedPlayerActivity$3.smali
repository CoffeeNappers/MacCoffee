.class Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;
.super Landroid/webkit/WebChromeClient;
.source "VideoEmbedPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->startLoading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field customCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field customView:Landroid/view/View;

.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 5

    .prologue
    const/high16 v4, 0x41200000    # 10.0f

    .line 176
    new-instance v0, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    invoke-direct {v0, v1}, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;-><init>(Landroid/content/Context;)V

    .line 177
    .local v0, "progr":Landroid/widget/ProgressBar;
    const v1, 0x7f0203d5

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setBackgroundResource(I)V

    .line 178
    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ProgressBar;->setPadding(IIII)V

    .line 179
    return-object v0
.end method

.method public onHideCustomView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 154
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "On hide custom view"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    if-nez v0, :cond_1

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->content:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 160
    iput-object v2, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    .line 161
    iput-object v2, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "progr"    # I

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 166
    const/16 v0, 0x64

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/CircularProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-static {v0, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iput-boolean v1, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->canShowProgress:Z

    .line 172
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    int-to-double v2, p2

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    div-double/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/ui/CircularProgressBar;->setProgress(D)V

    .line 173
    return-void

    .line 169
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/CircularProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-boolean v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->canShowProgress:Z

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->progress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "callback"    # Landroid/webkit/WebChromeClient$CustomViewCallback;

    .prologue
    const/4 v4, -0x1

    .line 137
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "on show custom view"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 139
    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 149
    :goto_0
    return-void

    .line 141
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    .line 142
    iput-object p2, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->webView:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity;->content:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoEmbedPlayerActivity$3;->customView:Landroid/view/View;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v2, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method
