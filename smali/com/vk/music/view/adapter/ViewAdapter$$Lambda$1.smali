.class final synthetic Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# instance fields
.field private final arg$1:Landroid/view/LayoutInflater;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Landroid/view/LayoutInflater;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;->arg$1:Landroid/view/LayoutInflater;

    iput p2, p0, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Landroid/view/LayoutInflater;I)Lcom/vkontakte/android/functions/F1;
    .locals 1

    new-instance v0, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;-><init>(Landroid/view/LayoutInflater;I)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;->arg$1:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/vk/music/view/adapter/ViewAdapter$$Lambda$1;->arg$2:I

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {v0, v1, p1}, Lcom/vk/music/view/adapter/ViewAdapter;->lambda$new$0(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
