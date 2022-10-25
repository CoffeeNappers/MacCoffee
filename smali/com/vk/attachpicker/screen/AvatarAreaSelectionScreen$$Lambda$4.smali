.class final synthetic Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;->arg$1:Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;-><init>(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;->arg$1:Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->lambda$loadImages$3(Ljava/lang/Throwable;)V

    return-void
.end method
