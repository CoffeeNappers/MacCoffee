.class Lcom/vkontakte/android/AudioPlayerActivity$2;
.super Landroid/view/ViewOutlineProvider;
.source "AudioPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioPlayerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioPlayerActivity;

.field final synthetic val$w:Landroid/view/Window;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Landroid/view/Window;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioPlayerActivity;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$2;->this$0:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$2;->val$w:Landroid/view/Window;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "outline"    # Landroid/graphics/Outline;

    .prologue
    const/4 v1, 0x0

    .line 211
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_0

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$2;->val$w:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$2;->val$w:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v4, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v5, v0

    move-object v0, p2

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 214
    :cond_0
    return-void
.end method
