.class Lcom/vkontakte/android/LinkRedirActivity$14;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$progress:Landroid/app/ProgressDialog;

.field final synthetic val$ref:Ljava/lang/String;

.field final synthetic val$refSource:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1614
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$14;->val$ref:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/LinkRedirActivity$14;->val$refSource:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/LinkRedirActivity$14;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1617
    .local p1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$14;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    new-instance v1, Lcom/vkontakte/android/LinkRedirActivity$14$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$14$1;-><init>(Lcom/vkontakte/android/LinkRedirActivity$14;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1632
    return-void
.end method
