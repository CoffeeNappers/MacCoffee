.class public final Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
.super Lcom/vk/music/fragment/menu/ActionsBottomSheet;
.source "PlaylistActionsBottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/fragment/menu/ActionsBottomSheet",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/vk/music/fragment/menu/ActionsBottomSheet;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 18
    invoke-static {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    .locals 1
    .param p0, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 61
    sget-object v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    return-object v0
.end method

.method static synthetic lambda$onCreateHeaderAdapter$0(Landroid/view/View;)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 70
    const v2, 0x7f1003e1

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 71
    .local v0, "menu":Landroid/widget/ImageView;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 72
    const v2, 0x7f020187

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 73
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .line 74
    .local v1, "params":Landroid/support/constraint/ConstraintLayout$LayoutParams;
    const/4 v2, 0x0

    iput v2, v1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 75
    return-void
.end method

.method static synthetic lambda$onCreateHeaderAdapter$2(Lcom/vk/music/dto/Playlist;)J
    .locals 2
    .param p0, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 84
    iget v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public static restoreCallback(Landroid/app/Activity;Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V
    .locals 2
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
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "callback":Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;, "Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback<Lcom/vk/music/dto/Playlist;>;"
    instance-of v1, p0, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v1, :cond_0

    .line 52
    check-cast p0, Landroid/support/v7/app/AppCompatActivity;

    .end local p0    # "activity":Landroid/app/Activity;
    invoke-virtual {p0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->find(Landroid/support/v4/app/FragmentManager;)Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    move-result-object v0

    .line 53
    .local v0, "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    if-eqz v0, :cond_0

    .line 54
    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->setCallback(Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;)V

    .line 57
    .end local v0    # "bottomSheet":Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateHeaderAdapter$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p3, "position"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->callback:Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;

    const v1, 0x7f100060

    invoke-interface {v0, p2, v1}, Lcom/vk/music/fragment/menu/ActionsBottomSheet$Callback;->onActionClick(Ljava/lang/Object;I)V

    .line 82
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->dismiss()V

    .line 83
    return-void
.end method

.method protected onCreateHeaderAdapter(I)Lcom/vk/music/view/adapter/ItemAdapter;
    .locals 3
    .param p1, "viewType"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v1, 0x7f03012b

    .line 68
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$1;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;

    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->init(Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/vk/music/view/adapter/PlaylistBinder;

    .line 76
    invoke-virtual {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/view/adapter/PlaylistBinder;-><init>(Lcom/vk/core/util/Resourcer;)V

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;->lambdaFactory$(Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    invoke-static {}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$3;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 85
    invoke-virtual {v0, p1}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->viewType(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v0

    return-object v0
.end method
