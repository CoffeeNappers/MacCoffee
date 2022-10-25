.class public final Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
.super Lcom/vk/music/fragment/menu/ActionsBottomSheet;
.source "AudioActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 23
    invoke-static {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    .locals 1
    .param p0, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 75
    sget-object v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    return-object v0
.end method

.method public static restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vkontakte/android/audio/MusicTrack;>;"
    instance-of v2, p0, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 65
    check-cast v1, Landroid/support/v7/app/AppCompatActivity;

    .line 66
    .local v1, "compatActivity":Landroid/support/v7/app/AppCompatActivity;
    invoke-virtual {v1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    move-result-object v0

    .line 67
    .local v0, "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->setCallback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 71
    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;
    .end local v1    # "compatActivity":Landroid/support/v7/app/AppCompatActivity;
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$null$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 94
    iget-object v1, p0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->header:Landroid/os/Parcelable;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/fragment/menu/Action;

    iget v0, v0, Lcom/vk/music/fragment/menu/Action;->id:I

    invoke-virtual {p0, v1, v0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->onActionClick(Landroid/os/Parcelable;I)V

    return-void
.end method

.method synthetic lambda$onCreateHeaderAdapter$1(Landroid/view/View;)V
    .locals 14
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    const/4 v13, -0x1

    .line 84
    const v10, 0x7f1003bf

    invoke-virtual {p1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    .line 85
    .local v8, "menu":Landroid/widget/ImageView;
    const/16 v10, 0x8

    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 86
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    .line 88
    .local v3, "args":Landroid/os/Bundle;
    const-string/jumbo v10, "extActions"

    invoke-virtual {v3, v10}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 90
    .local v1, "actions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/fragment/menu/Action;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 91
    .local v5, "count":I
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    .line 92
    .local v7, "inflater":Landroid/view/LayoutInflater;
    const v10, 0x7f1003c4

    invoke-virtual {p1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 93
    .local v2, "actionsBlock":Landroid/widget/LinearLayout;
    int-to-float v10, v5

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    .line 94
    invoke-static {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$3;->lambdaFactory$(Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;)Landroid/view/View$OnClickListener;

    move-result-object v4

    .line 95
    .local v4, "clickListener":Landroid/view/View$OnClickListener;
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/fragment/menu/Action;

    .line 96
    .local v0, "action":Lcom/vk/music/fragment/menu/Action;
    const v11, 0x7f03012a

    const/4 v12, 0x0

    invoke-virtual {v7, v11, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 97
    .local v6, "image":Landroid/widget/ImageView;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 99
    .local v9, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v11, 0x3f800000    # 1.0f

    iput v11, v9, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 100
    invoke-virtual {v2, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget v11, v0, Lcom/vk/music/fragment/menu/Action;->iconRes:I

    invoke-virtual {v6, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 102
    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 103
    invoke-virtual {v6, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 105
    .end local v0    # "action":Lcom/vk/music/fragment/menu/Action;
    .end local v6    # "image":Landroid/widget/ImageView;
    .end local v9    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method protected onCreateHeaderAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;
    .locals 2
    .param p1, "viewType"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v1, 0x7f030129

    .line 82
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/vk/music/view/adapter/MusicBinder;

    invoke-direct {v1}, Lcom/vk/music/view/adapter/MusicBinder;-><init>()V

    .line 106
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$2;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 108
    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v0

    return-object v0
.end method
