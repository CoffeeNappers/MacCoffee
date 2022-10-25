.class Lcom/vkontakte/android/LinkRedirActivity$12$2;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity$12;->success(Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/LinkRedirActivity$12;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity$12;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/LinkRedirActivity$12;

    .prologue
    .line 1368
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$12$2;->this$1:Lcom/vkontakte/android/LinkRedirActivity$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1371
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$12$2;->this$1:Lcom/vkontakte/android/LinkRedirActivity$12;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1372
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$12$2;->this$1:Lcom/vkontakte/android/LinkRedirActivity$12;

    iget-object v0, v0, Lcom/vkontakte/android/LinkRedirActivity$12;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1373
    return-void
.end method
