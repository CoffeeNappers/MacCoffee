.class final synthetic Lcom/vkontakte/android/data/Groups$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;

.field private final arg$2:Ljava/lang/String;

.field private final arg$3:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$1:Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;

    iput-object p2, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$2:Ljava/lang/String;

    iput p3, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$3:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Groups$$Lambda$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/data/Groups$$Lambda$2;-><init>(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$1:Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;

    iget-object v1, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$2:Ljava/lang/String;

    iget v2, p0, Lcom/vkontakte/android/data/Groups$$Lambda$2;->arg$3:I

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/data/Groups;->lambda$search$2(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)V

    return-void
.end method
