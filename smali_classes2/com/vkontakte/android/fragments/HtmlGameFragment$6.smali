.class Lcom/vkontakte/android/fragments/HtmlGameFragment$6;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 603
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 611
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "fail"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1400(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 612
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 606
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "success"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1400(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 607
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 603
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;->success(Ljava/lang/Boolean;)V

    return-void
.end method
