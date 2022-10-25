.class Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;
.super Landroid/graphics/drawable/LayerDrawable;
.source "AudioAttachView.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioAttachView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatableLayerDrawable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioAttachView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/AudioAttachView;[Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p2, "layers"    # [Landroid/graphics/drawable/Drawable;

    .prologue
    .line 407
    iput-object p1, p0, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;->this$0:Lcom/vkontakte/android/AudioAttachView;

    .line 408
    invoke-direct {p0, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 409
    return-void
.end method


# virtual methods
.method public isRunning()Z
    .locals 1

    .prologue
    .line 423
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->isRunning()Z

    move-result v0

    return v0
.end method

.method public start()V
    .locals 1

    .prologue
    .line 413
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 414
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 418
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 419
    return-void
.end method
