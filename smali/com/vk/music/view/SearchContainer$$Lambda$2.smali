.class final synthetic Lcom/vk/music/view/SearchContainer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/SearchContainer;

.field private final arg$2:Lcom/vk/music/model/SearchModel;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/model/SearchModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/SearchContainer;

    iput-object p2, p0, Lcom/vk/music/view/SearchContainer$$Lambda$2;->arg$2:Lcom/vk/music/model/SearchModel;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/model/SearchModel;)Landroid/view/View$OnFocusChangeListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/SearchContainer$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/SearchContainer$$Lambda$2;-><init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/model/SearchModel;)V

    return-object v0
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$$Lambda$2;->arg$1:Lcom/vk/music/view/SearchContainer;

    iget-object v1, p0, Lcom/vk/music/view/SearchContainer$$Lambda$2;->arg$2:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vk/music/view/SearchContainer;->lambda$new$1(Lcom/vk/music/model/SearchModel;Landroid/view/View;Z)V

    return-void
.end method
