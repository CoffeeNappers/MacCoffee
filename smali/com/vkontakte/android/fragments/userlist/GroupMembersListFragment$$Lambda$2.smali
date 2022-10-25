.class final synthetic Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;


# instance fields
.field private final arg$1:Ljava/lang/String;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;->arg$1:Ljava/lang/String;

    iput p2, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Ljava/lang/String;I)Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public getSearchRequest(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;->arg$1:Ljava/lang/String;

    iget v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$$Lambda$2;->arg$2:I

    invoke-static {v0, v1, p1, p2, p3}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->lambda$onCreate$0(Ljava/lang/String;ILjava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    return-object v0
.end method
