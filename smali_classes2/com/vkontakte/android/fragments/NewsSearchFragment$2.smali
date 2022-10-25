.class Lcom/vkontakte/android/fragments/NewsSearchFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "NewsSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsSearchFragment;->onAttach(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<[",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 60
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;->success([Ljava/lang/String;)V

    return-void
.end method

.method public success([Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # [Ljava/lang/String;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$102(Lcom/vkontakte/android/fragments/NewsSearchFragment;[Ljava/lang/String;)[Ljava/lang/String;

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$200(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$2;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$302(Lcom/vkontakte/android/fragments/NewsSearchFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 66
    return-void
.end method
