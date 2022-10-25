.class final synthetic Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;


# instance fields
.field private final arg$1:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vk/music/utils/SmallPlayerHelper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;->arg$1:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/utils/SmallPlayerHelper;)Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;
    .locals 1

    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;-><init>(Lcom/vk/music/utils/SmallPlayerHelper;)V

    return-object v0
.end method


# virtual methods
.method public onKeyboardStateChanged(Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/utils/SmallPlayerHelper$$Lambda$1;->arg$1:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0, p1}, Lcom/vk/music/utils/SmallPlayerHelper;->lambda$onCreateView$0(Z)V

    return-void
.end method
