.class final synthetic Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;


# direct methods
.method private constructor <init>(Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;->arg$1:Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;)Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;-><init>(Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;Ljava/lang/Object;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet$$Lambda$2;->arg$1:Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;

    check-cast p2, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/music/fragment/menu/PlaylistActionsBottomSheet;->lambda$onCreateHeaderAdapter$1(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V

    return-void
.end method
