.class final synthetic Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF2Int;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;)Lcom/vkontakte/android/functions/VoidF2Int;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    check-cast p1, Lcom/vkontakte/android/api/GroupInvitation;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;->lambda$new$1(Lcom/vkontakte/android/api/GroupInvitation;Ljava/lang/Boolean;I)V

    return-void
.end method
