.class final synthetic Lcom/vk/attachpicker/AttachActivity$$Lambda$17;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F0;


# static fields
.field private static final instance:Lcom/vk/attachpicker/AttachActivity$$Lambda$17;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/AttachActivity$$Lambda$17;

    invoke-direct {v0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$17;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/AttachActivity$$Lambda$17;->instance:Lcom/vk/attachpicker/AttachActivity$$Lambda$17;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vkontakte/android/functions/F0;
    .locals 1

    sget-object v0, Lcom/vk/attachpicker/AttachActivity$$Lambda$17;->instance:Lcom/vk/attachpicker/AttachActivity$$Lambda$17;

    return-object v0
.end method


# virtual methods
.method public f()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {}, Lcom/vk/attachpicker/AttachActivity;->lambda$initTabs$16()Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method
