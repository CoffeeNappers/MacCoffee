.class final synthetic Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;


# instance fields
.field private final arg$1:Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;


# direct methods
.method private constructor <init>(Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;->arg$1:Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;)Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    .locals 1

    new-instance v0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;-><init>(Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;)V

    return-object v0
.end method


# virtual methods
.method public apply(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet$$Lambda$1;->arg$1:Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;

    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/menu/AudioActionsBottomSheet;->lambda$onCreateHeaderAdapter$1(Landroid/view/View;)V

    return-void
.end method
