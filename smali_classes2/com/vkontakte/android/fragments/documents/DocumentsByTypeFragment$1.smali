.class Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "DocumentsByTypeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/api/Document;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 90
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/Document;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 85
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 80
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
