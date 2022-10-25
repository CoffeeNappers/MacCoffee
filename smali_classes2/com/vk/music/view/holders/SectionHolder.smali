.class public Lcom/vk/music/view/holders/SectionHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SectionHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;,
        Lcom/vk/music/view/holders/SectionHolder$PlaylistHolder;,
        Lcom/vk/music/view/holders/SectionHolder$AudioHolder;,
        Lcom/vk/music/view/holders/SectionHolder$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

.field private final subtitle:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final title:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final type:Lcom/vk/music/dto/Section$Type;

.field private final usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;ILcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .param p3, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I",
            "Lcom/vk/music/model/RecommendedModel;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 52
    const v1, 0x7f03014c

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 54
    invoke-static {p2}, Lcom/vk/music/view/holders/SectionHolder;->getTypeByOrdinal(I)Lcom/vk/music/dto/Section$Type;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionHolder;->type:Lcom/vk/music/dto/Section$Type;

    .line 56
    const v1, 0x1020014

    invoke-virtual {p0, v1}, Lcom/vk/music/view/holders/SectionHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionHolder;->title:Landroid/widget/TextView;

    .line 57
    const v1, 0x1020015

    invoke-virtual {p0, v1}, Lcom/vk/music/view/holders/SectionHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionHolder;->subtitle:Landroid/widget/TextView;

    .line 58
    const v1, 0x7f1003d4

    invoke-virtual {p0, v1}, Lcom/vk/music/view/holders/SectionHolder;->$(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    new-instance v1, Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder;->type:Lcom/vk/music/dto/Section$Type;

    invoke-direct {v1, v2, p3, p4}, Lcom/vk/music/view/holders/SectionHolder$Adapter;-><init>(Lcom/vk/music/dto/Section$Type;Lcom/vk/music/model/RecommendedModel;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    .line 62
    const v1, 0x7f1001c2

    invoke-virtual {p0, v1}, Lcom/vk/music/view/holders/SectionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 63
    .local v0, "rv":Lme/grishka/appkit/views/UsableRecyclerView;
    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setNestedScrollingEnabled(Z)V

    .line 65
    sget-object v1, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v2}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 85
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Wrong view type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 67
    :pswitch_0
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {v1, v2, v3, v4, v4}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 68
    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x43400000    # 192.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 69
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingTop()I

    move-result v2

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 88
    :goto_0
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 89
    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 90
    return-void

    .line 74
    :pswitch_1
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 75
    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x42dc0000    # 110.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 76
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;-><init>(I)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    goto :goto_0

    .line 80
    :pswitch_2
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v4, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 81
    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x43430000    # 195.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 82
    new-instance v1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$SpacesItemDecoration;-><init>(I)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    goto :goto_0

    .line 65
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public static getTypeByOrdinal(I)Lcom/vk/music/dto/Section$Type;
    .locals 1
    .param p0, "ordinal"    # I

    .prologue
    .line 157
    if-ltz p0, :cond_0

    invoke-static {}, Lcom/vk/music/dto/Section$Type;->values()[Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 158
    invoke-static {}, Lcom/vk/music/dto/Section$Type;->values()[Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    aget-object v0, v0, p0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/vk/music/dto/Section$Type;->unknown:Lcom/vk/music/dto/Section$Type;

    goto :goto_0
.end method

.method private onMusicShowAllButtonClick(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 125
    sget-object v1, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vk/music/dto/Section;

    iget-object v0, v0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 139
    :goto_0
    return-void

    .line 127
    :pswitch_0
    new-instance v1, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v1}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/MusicFragment$Builder;->catalogBlockId(Lcom/vk/music/dto/Section;)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 132
    :pswitch_1
    new-instance v1, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget v0, v0, Lcom/vk/music/dto/Section;->id:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget-object v0, v0, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;->title(Ljava/lang/String;)Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 136
    :pswitch_2
    new-instance v1, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v1}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget v0, v0, Lcom/vk/music/dto/Section;->id:I

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->catalogBlockId(I)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    iget-object v0, v0, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->title(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 125
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onBind(Lcom/vk/music/dto/Section;)V
    .locals 3
    .param p1, "item"    # Lcom/vk/music/dto/Section;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->subtitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->subtitle:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 97
    sget-object v0, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v1, p1, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 113
    :goto_0
    return-void

    .line 99
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->setDataAndUpdateView(Ljava/util/ArrayList;Lcom/vk/music/dto/Section;)V

    goto :goto_0

    .line 104
    :pswitch_1
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->profiles:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->setDataAndUpdateView(Ljava/util/ArrayList;Lcom/vk/music/dto/Section;)V

    goto :goto_0

    .line 107
    :pswitch_2
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->setDataAndUpdateView(Ljava/util/ArrayList;Lcom/vk/music/dto/Section;)V

    goto :goto_0

    .line 110
    :pswitch_3
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder;->adapter:Lcom/vk/music/view/holders/SectionHolder$Adapter;

    iget-object v1, p1, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lcom/vk/music/view/holders/SectionHolder$Adapter;->setDataAndUpdateView(Ljava/util/ArrayList;Lcom/vk/music/dto/Section;)V

    goto :goto_0

    .line 97
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    check-cast p1, Lcom/vk/music/dto/Section;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/holders/SectionHolder;->onBind(Lcom/vk/music/dto/Section;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 117
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 122
    :goto_0
    return-void

    .line 119
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vk/music/view/holders/SectionHolder;->onMusicShowAllButtonClick(Landroid/content/Context;)V

    goto :goto_0

    .line 117
    :pswitch_data_0
    .packed-switch 0x7f1003d4
        :pswitch_0
    .end packed-switch
.end method

.method public updatePlayingState()V
    .locals 5

    .prologue
    .line 142
    sget-object v3, Lcom/vk/music/view/holders/SectionHolder$1;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionHolder;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v4}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 152
    :cond_0
    return-void

    .line 144
    :pswitch_0
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionHolder;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v0

    .line 145
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 146
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionHolder;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionHolder;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 147
    invoke-virtual {v4, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 146
    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;

    .line 148
    .local v1, "holder":Lcom/vk/music/view/holders/SectionHolder$AudioHolder;
    invoke-virtual {v1}, Lcom/vk/music/view/holders/SectionHolder$AudioHolder;->updatePlayingState()V

    .line 145
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
