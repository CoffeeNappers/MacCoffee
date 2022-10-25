.class final synthetic Lcom/vk/music/view/SearchContainer$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/SearchContainer;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchContainer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$$Lambda$3;->arg$1:Lcom/vk/music/view/SearchContainer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Landroid/widget/TextView$OnEditorActionListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/SearchContainer$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/music/view/SearchContainer$$Lambda$3;-><init>(Lcom/vk/music/view/SearchContainer;)V

    return-object v0
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$$Lambda$3;->arg$1:Lcom/vk/music/view/SearchContainer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/music/view/SearchContainer;->lambda$new$2(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
