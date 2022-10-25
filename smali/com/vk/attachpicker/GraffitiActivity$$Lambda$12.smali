.class final synthetic Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field private static final instance:Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;

    invoke-direct {v0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;->instance:Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lio/reactivex/functions/Consumer;
    .locals 1

    sget-object v0, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;->instance:Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/vk/attachpicker/GraffitiActivity;->lambda$onCreate$11(Ljava/lang/Throwable;)V

    return-void
.end method
