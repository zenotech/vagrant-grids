slurm:
    pkg.installed:
        - pkgs:
            - slurm-llnl 
            
/etc/default/munge :
    file.managed:
        - source: salt://slurm/munge

/etc/munge/munge.key:
    file.managed:
        - source: salt://slurm/munge.key

/etc/slurm-llnl/slurm.conf :
    file.managed:
        - source: salt://slurm/slurm.conf

initialize:
    cmd.script:
        - require:
            - file: /etc/slurm-llnl/slurm.conf
            - file: /etc/default/munge 
            - file: /etc/munge/munge.key
            - pkg: slurm
        - source: salt://slurm/init_slurm.sh
        - mode: 0755



