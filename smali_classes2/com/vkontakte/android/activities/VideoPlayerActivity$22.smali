.class Lcom/vkontakte/android/activities/VideoPlayerActivity$22;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTextureViewScale()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 1023
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 11

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x0

    const/high16 v10, 0x40000000    # 2.0f

    .line 1026
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1027
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float v2, v5, v8

    .line 1028
    .local v2, "sratio":F
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float v4, v5, v8

    .line 1029
    .local v4, "vratio":F
    cmpl-float v5, v2, v4

    if-lez v5, :cond_1

    .line 1030
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    .line 1031
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    .line 1037
    :goto_0
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v5, v8

    int-to-float v3, v5

    .line 1038
    .local v3, "textureCenter":F
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v7, :cond_2

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    :goto_1
    int-to-float v5, v5

    sub-float v0, v5, v3

    .line 1040
    .local v0, "maxBottom":F
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    mul-float/2addr v8, v9

    div-float/2addr v8, v10

    invoke-static {v8, v0}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v9

    shr-int/lit8 v9, v9, 0x1

    int-to-float v9, v9

    sub-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsFit:F

    .line 1041
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    mul-float/2addr v8, v9

    div-float/2addr v8, v10

    invoke-static {v8, v0}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v9

    shr-int/lit8 v9, v9, 0x1

    int-to-float v9, v9

    sub-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsCrop:F

    .line 1043
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v1, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    .line 1044
    .local v1, "scale":F
    :goto_2
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setScaleX(F)V

    .line 1045
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setScaleY(F)V

    .line 1046
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->setScaleX(F)V

    .line 1047
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    invoke-virtual {v5, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->setScaleY(F)V

    .line 1048
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->fill:Z

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsCrop:F

    :goto_3
    invoke-virtual {v8, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 1050
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeButton:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    sub-float/2addr v5, v9

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v9, 0x3c23d70a    # 0.01f

    cmpg-float v5, v5, v9

    if-ltz v5, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->landscape:Z

    if-nez v5, :cond_5

    :cond_0
    move v5, v7

    :goto_4
    invoke-virtual {v8, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1051
    return v6

    .line 1033
    .end local v0    # "maxBottom":F
    .end local v1    # "scale":F
    .end local v3    # "textureCenter":F
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    .line 1034
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v8, v8, Lcom/vkontakte/android/activities/VideoPlayerActivity;->content:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v9, v9, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    iput v8, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleCrop:F

    goto/16 :goto_0

    .line 1038
    .restart local v3    # "textureCenter":F
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomAnchor:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    goto/16 :goto_1

    .line 1043
    .restart local v0    # "maxBottom":F
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v1, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texScaleFit:F

    goto/16 :goto_2

    .line 1048
    .restart local v1    # "scale":F
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$22;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget v5, v5, Lcom/vkontakte/android/activities/VideoPlayerActivity;->translationControlsFit:F

    goto :goto_3

    :cond_5
    move v5, v6

    .line 1050
    goto :goto_4
.end method
