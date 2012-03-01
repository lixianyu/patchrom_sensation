.class Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;
.super Ljava/lang/Object;
.source "IdleScreenEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/htc/lockscreen/idlescreen/IdleScreenEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WakeLockHelper"
.end annotation


# instance fields
.field private mTag:Ljava/lang/String;

.field private mUIWakeLock:Landroid/os/PowerManager$WakeLock;

.field final synthetic this$0:Lcom/htc/lockscreen/idlescreen/IdleScreenEngine;


# direct methods
.method public constructor <init>(Lcom/htc/lockscreen/idlescreen/IdleScreenEngine;)V
    .locals 1
    .parameter

    .prologue
    .line 680
    iput-object p1, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->this$0:Lcom/htc/lockscreen/idlescreen/IdleScreenEngine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 678
    const-string v0, "idlescreen"

    iput-object v0, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mTag:Ljava/lang/String;

    .line 681
    return-void
.end method


# virtual methods
.method public UIWakeLock(Landroid/content/Context;I)V
    .locals 5
    .parameter "context"
    .parameter "ms"

    .prologue
    .line 688
    monitor-enter p0

    .line 689
    const/4 v0, 0x0

    .line 690
    .local v0, old:Landroid/os/PowerManager$WakeLock;
    :try_start_0
    iget-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v2, :cond_0

    .line 691
    iget-object v0, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 692
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 694
    :cond_0
    iget-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v2, :cond_1

    if-lez p2, :cond_1

    .line 695
    const-string v2, "power"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 696
    .local v1, pm:Landroid/os/PowerManager;
    const/16 v2, 0x1a

    iget-object v3, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mTag:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 698
    iget-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 699
    iget-object v2, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mUIWakeLock:Landroid/os/PowerManager$WakeLock;

    int-to-long v3, p2

    invoke-virtual {v2, v3, v4}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 701
    .end local v1           #pm:Landroid/os/PowerManager;
    :cond_1
    if-eqz v0, :cond_2

    .line 702
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 705
    :cond_2
    monitor-exit p0

    .line 706
    return-void

    .line 705
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0
    .parameter "tag"

    .prologue
    .line 684
    iput-object p1, p0, Lcom/htc/lockscreen/idlescreen/IdleScreenEngine$WakeLockHelper;->mTag:Ljava/lang/String;

    .line 685
    return-void
.end method