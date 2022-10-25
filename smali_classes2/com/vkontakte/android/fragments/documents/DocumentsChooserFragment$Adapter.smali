.class Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "DocumentsChooserFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex",
            "<",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 176
    new-instance v0, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 220
    const/4 v0, 0x4

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x2

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 210
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 174
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 200
    if-nez p2, :cond_0

    .line 201
    check-cast p1, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->bind(Ljava/lang/Object;)V

    .line 206
    :goto_0
    return-void

    .line 203
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    const/4 v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->index:I

    .line 204
    check-cast p1, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 174
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 190
    packed-switch p2, :pswitch_data_0

    .line 194
    new-instance v0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;-><init>(Landroid/view/ViewGroup;)V

    :goto_0
    return-object v0

    .line 192
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 190
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public setData(Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;)V
    .locals 6
    .param p1, "res"    # Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;

    .prologue
    .line 180
    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->clear()V

    .line 181
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docTypes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 182
    iget-object v2, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docTypes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;

    .line 183
    .local v0, "docType":Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->docTypes:Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;

    new-instance v4, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    if-nez v1, :cond_0

    iget-object v2, p1, Lcom/vkontakte/android/api/docs/DocsGetTypes$Result;->docs:Lcom/vkontakte/android/data/VKList;

    :goto_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    invoke-direct {v4, v0, v2, v5}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;-><init>(Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;Ljava/util/ArrayList;I)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/widget/SubPagerOfList$ArrayListWithIndex;->add(Ljava/lang/Object;)Z

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 183
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 185
    .end local v0    # "docType":Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;->notifyDataSetChanged()V

    .line 186
    return-void
.end method
