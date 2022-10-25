.class Lcom/vkontakte/android/LinkRedirActivity$12$1;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 1375
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$12$1;->this$1:Lcom/vkontakte/android/LinkRedirActivity$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1378
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 1379
    return-void
.end method
