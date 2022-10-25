.class Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;
.super Lcom/vkontakte/android/ui/widget/SubPagerOfListItem$SubPagerOfListAdapter;
.source "DocumentsTabbedHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DocumentsAdapter"
.end annotation


# static fields
.field private static final VIEW_TYPE_DOC:I = 0x0

.field private static final VIEW_TYPE_LOADER:I = 0x1


# instance fields
.field private final context:Landroid/content/Context;

.field private data:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;"
        }
    .end annotation
.end field

.field private isLoaderShowing:Z

.field private final onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;Landroid/content/Context;ZLcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "isLoaderShowing"    # Z
    .param p5, "onNeedLoadNextPage"    # Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "Z",
            "Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;",
            ")V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/SubPagerOfListItem$SubPagerOfListAdapter;-><init>()V

    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->isLoaderShowing:Z

    .line 108
    iput-boolean p4, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->isLoaderShowing:Z

    .line 109
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    .line 110
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->title:Ljava/lang/String;

    .line 111
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->context:Landroid/content/Context;

    .line 112
    iput-object p5, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    .line 113
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->isLoaderShowing:Z

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 182
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x0

    .line 125
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->isLoaderShowing:Z

    if-eqz v1, :cond_0

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 128
    :cond_0
    :goto_0
    return v0

    .line 126
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->title:Ljava/lang/String;

    return-object v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 170
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 175
    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_0
    return-void

    .line 172
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :pswitch_0
    check-cast p1, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 170
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 134
    packed-switch p2, :pswitch_data_0

    .line 164
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/LoaderHolder;-><init>(Landroid/view/ViewGroup;)V

    :goto_0
    return-object v0

    .line 136
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;-><init>(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;Landroid/content/Context;)V

    .line 158
    .local v0, "documentHolder":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<Lcom/vkontakte/android/api/Document;>;"
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->itemView:Landroid/view/View;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 159
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->itemView:Landroid/view/View;

    const v2, 0x7f02013e

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 134
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onScroll(Landroid/support/v7/widget/RecyclerView;III)V
    .locals 2
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 193
    add-int v0, p3, p2

    add-int/lit8 v1, p4, -0x3

    if-lt v0, v1, :cond_0

    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;->onNeedLoadNextPage()V

    .line 196
    :cond_0
    return-void
.end method

.method public setData(Ljava/util/ArrayList;Z)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isLoaderShowing"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p1, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->data:Ljava/util/ArrayList;

    .line 117
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->isLoaderShowing:Z

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->notifyDataSetChanged()V

    .line 119
    return-void
.end method
