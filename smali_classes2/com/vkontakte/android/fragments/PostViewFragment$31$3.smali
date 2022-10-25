.class Lcom/vkontakte/android/fragments/PostViewFragment$31$3;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$31;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PostViewFragment$31;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$31;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PostViewFragment$31;

    .prologue
    .line 2015
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31$3;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$31;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 2018
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31$3;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$31;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2019
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31$3;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$31;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 2020
    return-void
.end method
