.class Lcom/vkontakte/android/LinkRedirActivity$15;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;


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

.field final synthetic val$uid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/app/ProgressDialog;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1635
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->val$progress:Landroid/app/ProgressDialog;

    iput p3, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->val$uid:I

    iput-object p4, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->val$ref:Ljava/lang/String;

    iput-object p5, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->val$refSource:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1638
    .local p1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$15;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    new-instance v1, Lcom/vkontakte/android/LinkRedirActivity$15$1;

    invoke-direct {v1, p0, p2}, Lcom/vkontakte/android/LinkRedirActivity$15$1;-><init>(Lcom/vkontakte/android/LinkRedirActivity$15;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1648
    return-void
.end method
