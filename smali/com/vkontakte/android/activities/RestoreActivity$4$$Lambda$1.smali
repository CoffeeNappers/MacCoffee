.class final synthetic Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/activities/RestoreActivity$4;

.field private final arg$2:I

.field private final arg$3:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/activities/RestoreActivity$4;ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/activities/RestoreActivity$4;

    iput p2, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$3:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity$4;ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;-><init>(Lcom/vkontakte/android/activities/RestoreActivity$4;ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/activities/RestoreActivity$4;

    iget v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->arg$3:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity$4;->lambda$fail$0(ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    return-void
.end method