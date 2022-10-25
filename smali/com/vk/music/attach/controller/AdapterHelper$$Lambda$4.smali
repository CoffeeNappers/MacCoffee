.class final synthetic Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# instance fields
.field private final arg$1:Landroid/view/LayoutInflater;

.field private final arg$2:Lcom/vkontakte/android/functions/VoidF;


# direct methods
.method private constructor <init>(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;->arg$1:Landroid/view/LayoutInflater;

    iput-object p2, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;->arg$2:Lcom/vkontakte/android/functions/VoidF;

    return-void
.end method

.method public static lambdaFactory$(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vkontakte/android/functions/F1;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;-><init>(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;->arg$1:Landroid/view/LayoutInflater;

    iget-object v1, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$4;->arg$2:Lcom/vkontakte/android/functions/VoidF;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {v0, v1, p1}, Lcom/vk/music/attach/controller/AdapterHelper;->lambda$createErrorAdapter$3(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
