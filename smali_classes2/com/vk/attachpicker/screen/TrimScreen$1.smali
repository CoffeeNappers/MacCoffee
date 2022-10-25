.class Lcom/vk/attachpicker/screen/TrimScreen$1;
.super Ljava/lang/Object;
.source "TrimScreen.java"

# interfaces
.implements Lcom/vk/attachpicker/videotrim/VideoTimelineView$VideoTimelineViewDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/TrimScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/TrimScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLeftProgressChanged(F)V
    .locals 4
    .param p1, "progress"    # F

    .prologue
    const/4 v3, 0x0

    .line 133
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 155
    :goto_0
    return-void

    .line 136
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$200(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$100(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 138
    :try_start_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$302(Lcom/vk/attachpicker/screen/TrimScreen;F)F

    .line 139
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->pause()V

    .line 141
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$400(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 143
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    :goto_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getProgress()F

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    .line 148
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    .line 149
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v3}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V

    .line 154
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$800(Lcom/vk/attachpicker/screen/TrimScreen;)V

    goto/16 :goto_0

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 150
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getProgress()F

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    .line 151
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    .line 152
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v3}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V

    goto :goto_2
.end method

.method public onRightProgressChanged(F)V
    .locals 4
    .param p1, "progress"    # F

    .prologue
    const/4 v3, 0x0

    .line 159
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 181
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$200(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$100(Lcom/vk/attachpicker/screen/TrimScreen;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 164
    :try_start_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$302(Lcom/vk/attachpicker/screen/TrimScreen;F)F

    .line 165
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 166
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->pause()V

    .line 167
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$400(Lcom/vk/attachpicker/screen/TrimScreen;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 169
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    :goto_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getProgress()F

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    .line 174
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    .line 175
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v3}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V

    .line 180
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$800(Lcom/vk/attachpicker/screen/TrimScreen;)V

    goto/16 :goto_0

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 176
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getProgress()F

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    .line 177
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    .line 178
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v2

    iget-object v3, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v3}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V

    goto :goto_2
.end method

.method public onSeekBarDrag(F)V
    .locals 3
    .param p1, "progress"    # F

    .prologue
    .line 185
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result v1

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    .line 186
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getLeftProgress()F

    move-result p1

    .line 187
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    .line 192
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    if-nez v1, :cond_2

    .line 203
    :goto_1
    return-void

    .line 188
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result v1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_0

    .line 189
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->getRightProgress()F

    move-result p1

    .line 190
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$600(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/videotrim/VideoTimelineView;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/attachpicker/videotrim/VideoTimelineView;->setProgress(F)V

    goto :goto_0

    .line 196
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$302(Lcom/vk/attachpicker/screen/TrimScreen;F)F

    .line 198
    :try_start_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$000(Lcom/vk/attachpicker/screen/TrimScreen;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->getDuration()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/TextureVideoView;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    :goto_2
    iget-object v1, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$1;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$500(Lcom/vk/attachpicker/screen/TrimScreen;)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/screen/TrimScreen;->access$700(Lcom/vk/attachpicker/screen/TrimScreen;I)V

    goto :goto_1

    .line 199
    :catch_0
    move-exception v0

    .line 200
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2
.end method
