.class final synthetic Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;->arg$1:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Landroid/app/Activity;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;->arg$1:Landroid/app/Activity;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$12;->lambda$loadAndShow$2(Landroid/app/Activity;Ljava/lang/Throwable;)V

    return-void
.end method
