.class final synthetic Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;


# static fields
.field private static final instance:Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;

    invoke-direct {v0}, Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;-><init>()V

    sput-object v0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;->instance:Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$Builder$Init;
    .locals 1

    sget-object v0, Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;->instance:Lcom/vk/music/view/PlaylistsContainer$$Lambda$5;

    return-object v0
.end method


# virtual methods
.method public apply(Landroid/view/View;)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vk/music/view/PlaylistsContainer;->lambda$new$2(Landroid/view/View;)V

    return-void
.end method
