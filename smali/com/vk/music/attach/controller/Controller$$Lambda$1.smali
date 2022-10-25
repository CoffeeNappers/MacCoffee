.class final synthetic Lcom/vk/music/attach/controller/Controller$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/attach/controller/Controller;


# direct methods
.method private constructor <init>(Lcom/vk/music/attach/controller/Controller;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/Controller$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/Controller;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/attach/controller/Controller;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/Controller$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/Controller$$Lambda$1;-><init>(Lcom/vk/music/attach/controller/Controller;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/Controller$$Lambda$1;->arg$1:Lcom/vk/music/attach/controller/Controller;

    invoke-virtual {v0, p1}, Lcom/vk/music/attach/controller/Controller;->lambda$onResume$0(Landroid/view/View;)V

    return-void
.end method
