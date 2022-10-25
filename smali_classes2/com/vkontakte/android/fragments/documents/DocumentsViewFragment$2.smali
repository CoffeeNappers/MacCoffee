.class Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;
.super Ljava/lang/Object;
.source "DocumentsViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->doLoadData()V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

.field final synthetic val$ownerId:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    iput p2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->val$ownerId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->access$100(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->access$200(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 154
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V
    .locals 7
    .param p1, "result"    # Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;

    .prologue
    .line 134
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v1, "fragments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v3, "titles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docTypes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 138
    iget-object v4, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docTypes:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;

    .line 139
    .local v0, "docType":Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;
    iget v5, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->val$ownerId:I

    iget v6, v0, Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;->id:I

    if-nez v2, :cond_0

    iget-object v4, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docs:Lcom/vkontakte/android/data/VKList;

    :goto_1
    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->create(IILcom/vkontakte/android/data/VKList;)Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    iget-object v4, v0, Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;->name:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 139
    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 143
    .end local v0    # "docType":Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    iget-boolean v5, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->canAdd:Z

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->setCanAdd(Z)V

    .line 144
    iget-object v4, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    invoke-static {v5, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->access$002(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 145
    iget-object v4, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->dataLoaded()V

    .line 146
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 131
    check-cast p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;->success(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V

    return-void
.end method
