.class Lcom/vkontakte/android/ui/GifDialog$1$2;
.super Ljava/lang/Object;
.source "GifDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/GifDialog$1;->hideProgressBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/GifDialog$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/GifDialog$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/GifDialog$1;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/ui/GifDialog$1$2;->this$1:Lcom/vkontakte/android/ui/GifDialog$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifDialog$1$2;->this$1:Lcom/vkontakte/android/ui/GifDialog$1;

    iget-object v0, v0, Lcom/vkontakte/android/ui/GifDialog$1;->this$0:Lcom/vkontakte/android/ui/GifDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ui/GifDialog;->access$000(Lcom/vkontakte/android/ui/GifDialog;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 49
    return-void
.end method
