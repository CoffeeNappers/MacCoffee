.class final synthetic Lcom/vk/attachpicker/AttachActivity$$Lambda$12;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F0;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/AttachActivity;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/AttachActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/AttachActivity$$Lambda$12;->arg$1:Lcom/vk/attachpicker/AttachActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/AttachActivity;)Lcom/vkontakte/android/functions/F0;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/AttachActivity$$Lambda$12;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/AttachActivity$$Lambda$12;-><init>(Lcom/vk/attachpicker/AttachActivity;)V

    return-object v0
.end method


# virtual methods
.method public f()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/AttachActivity$$Lambda$12;->arg$1:Lcom/vk/attachpicker/AttachActivity;

    invoke-virtual {v0}, Lcom/vk/attachpicker/AttachActivity;->lambda$initTabs$11()Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method
