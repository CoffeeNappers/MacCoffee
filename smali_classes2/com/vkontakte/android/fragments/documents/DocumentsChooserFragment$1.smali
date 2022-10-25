.class Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;
.super Ljava/lang/Object;
.source "DocumentsChooserFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->doLoadData(II)V
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
        "Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->access$200(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->access$300(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->access$402(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 115
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->access$000(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->setData(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docTypes:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->access$100(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;Ljava/util/List;Z)V

    .line 107
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 102
    check-cast p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;->success(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V

    return-void
.end method
