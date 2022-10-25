.class final synthetic Lcom/vk/music/view/SearchContainer$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/SearchContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$$Lambda$4;->arg$1:Lcom/vk/music/view/SearchContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/SearchContainer$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vk/music/view/SearchContainer$$Lambda$4;-><init>(Lcom/vk/music/view/SearchContainer;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$$Lambda$4;->arg$1:Lcom/vk/music/view/SearchContainer;

    invoke-virtual {v0, p1}, Lcom/vk/music/view/SearchContainer;->lambda$new$3(Landroid/view/View;)V

    return-void
.end method
