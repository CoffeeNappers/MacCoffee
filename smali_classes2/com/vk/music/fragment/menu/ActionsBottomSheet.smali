.class public abstract Lcom/vk/music/fragment/menu/ActionsBottomSheet;
.super Landroid/support/design/widget/BottomSheetDialogFragment;
.source "ActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/menu/ActionsBottomSheet$ArgsBuilder;,
        Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Header::",
        "Landroid/os/Parcelable;",
        ">",
        "Landroid/support/design/widget/BottomSheetDialogFragment;"
    }
.end annotation


# static fields
.field protected static final ARG_ACTIONS:Ljava/lang/String; = "actions"

.field protected static final ARG_EXT_ACTIONS:Ljava/lang/String; = "extActions"

.field protected static final ARG_HEADER:Ljava/lang/String; = "header"

.field private static final VIEW_TYPE_ACTION:I = 0x2

.field private static final VIEW_TYPE_HEADER:I = 0x1


# instance fields
.field actions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/fragment/menu/Action;",
            ">;"
        }
    .end annotation
.end field

.field protected callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<THeader;>;"
        }
    .end annotation
.end field

.field header:Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "THeader;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreateActionAdapter$1(Lcom/vk/music/fragment/menu/Action;)J
    .locals 2
    .param p0, "actionInfo"    # Lcom/vk/music/fragment/menu/Action;

    .prologue
    .line 151
    iget v0, p0, Lcom/vk/music/fragment/menu/Action;->id:I

    int-to-long v0, v0

    return-wide v0
.end method


# virtual methods
.method public getTheme()I
    .locals 1

    .prologue
    .line 83
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    const v0, 0x7f0b00a0

    return v0
.end method

.method synthetic lambda$onCreateActionAdapter$0(Landroid/view/View;Lcom/vk/music/fragment/menu/Action;I)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "actionInfo"    # Lcom/vk/music/fragment/menu/Action;
    .param p3, "position"    # I

    .prologue
    .line 148
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    iget-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->header:Landroid/os/Parcelable;

    iget v1, p2, Lcom/vk/music/fragment/menu/Action;->id:I

    invoke-virtual {p0, v0, v1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->onActionClick(Landroid/os/Parcelable;I)V

    .line 149
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->dismiss()V

    .line 150
    return-void
.end method

.method protected onActionClick(Landroid/os/Parcelable;I)V
    .locals 1
    .param p1    # Landroid/os/Parcelable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actionId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THeader;I)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    .local p1, "header":Landroid/os/Parcelable;, "THeader;"
    iget-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    invoke-interface {v0, p1, p2}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;->onActionClick(Ljava/lang/Object;I)V

    .line 170
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->dismiss()V

    .line 171
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 88
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    invoke-super {p0, p1}, Landroid/support/design/widget/BottomSheetDialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 89
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 90
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "header"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->header:Landroid/os/Parcelable;

    .line 91
    const-string/jumbo v1, "actions"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->actions:Ljava/util/ArrayList;

    .line 92
    return-void
.end method

.method protected onCreateActionAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;
    .locals 3
    .param p1, "viewType"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vk/music/fragment/menu/Action;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    iget-object v1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->actions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 117
    .local v0, "lastActionPosition":I
    new-instance v1, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v2, 0x7f030122

    .line 118
    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;

    invoke-direct {v2, p0, v0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$1;-><init>(Lcom/vk/music/fragment/menu/ActionsBottomSheet;I)V

    .line 119
    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/menu/ActionsBottomSheet;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v2

    .line 147
    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    invoke-static {}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$$Lambda$2;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v2

    .line 151
    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    .line 152
    invoke-virtual {v1, p1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v1

    .line 153
    invoke-virtual {v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v1

    return-object v1
.end method

.method protected abstract onCreateHeaderAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<THeader;>;"
        }
    .end annotation
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    const/4 v5, -0x1

    const/4 v6, 0x1

    .line 97
    new-instance v3, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 98
    .local v3, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    invoke-virtual {v3, v6}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 100
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5, v6, v6}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 102
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->onCreateActionAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v0

    .line 103
    .local v0, "actionsAdapter":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<Lcom/vk/music/fragment/menu/Action;>;"
    iget-object v4, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->actions:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 104
    invoke-virtual {p0, v6}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->onCreateHeaderAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v2

    .line 105
    .local v2, "headerAdapter":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<THeader;>;"
    iget-object v4, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->header:Landroid/os/Parcelable;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 106
    new-instance v1, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 107
    .local v1, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    invoke-virtual {v1, v6}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 108
    invoke-virtual {v1, v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 109
    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 110
    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 111
    return-object v3
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 163
    invoke-super {p0}, Landroid/support/design/widget/BottomSheetDialogFragment;->onDestroyView()V

    .line 164
    return-void
.end method

.method public setCallback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<THeader;>;)V"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/vk/music/fragment/menu/ActionsBottomSheet;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet<THeader;>;"
    .local p1, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<THeader;>;"
    iput-object p1, p0, Lcom/vk/music/fragment/menu/ActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    .line 158
    return-void
.end method
