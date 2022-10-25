.class final synthetic Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/functions/VoidF;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/functions/VoidF;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;->arg$1:Lcom/vkontakte/android/functions/VoidF;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/functions/VoidF;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;-><init>(Lcom/vkontakte/android/functions/VoidF;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/attach/controller/AdapterHelper$$Lambda$6;->arg$1:Lcom/vkontakte/android/functions/VoidF;

    invoke-static {v0, p1}, Lcom/vk/music/attach/controller/AdapterHelper;->lambda$null$2(Lcom/vkontakte/android/functions/VoidF;Landroid/view/View;)V

    return-void
.end method
